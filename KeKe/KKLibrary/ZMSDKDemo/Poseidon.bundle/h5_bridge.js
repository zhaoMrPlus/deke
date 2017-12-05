window.AlipayJSBridge || (function () {
    var iframe = null;

    function renderIframe() {
        if (iframe) return;
        try {
            iframe = document.createElement("iframe");
            iframe.id = "__AlipayJSBridgeIframe";
            iframe.style.display = "none";
            document.documentElement.appendChild(iframe);
        } catch (e) {

        }
    }

    function onDOMReady(callback) {
        var readyRE = /complete|loaded|interactive/;
        if (readyRE.test(document.readyState)) {
            callback();
        } else {
            document.addEventListener('DOMContentLoaded', function () {
                callback();
            }, false);
        }
    }

    var callbackPoll = {};

    var sendMessageQueue = [];
    var receiveMessageQueue = [];

    // H5动态插件相关
    var H5_PLUGIN_BASE_URL = "jsplugin://www.alipay.com?plugins=";
    var H5_PLUGIN_CALLBACK_UNIQUE_ID = 0;
    var H5_PLUGIN_CALLBACK_PREFIX = "h5dp_callback_id_";
    var H5_PLUGIN_STACK = [];

    var JSAPI = {
        /*
         * 调用Native功能
         */
        call: function (func, param, callback) {
            //jsbridge注入提前后，DOM环境可能还没创建，原jsbridge注入的同时创建iframe的方式将创建失败，改为调用接口的时候创建iframe
            renderIframe();
            if (!iframe) return;
            //
            if ('string' !== typeof func) {
                return;
            }

            if ('function' === typeof param) {
                callback = param;
                param = null;
            } else if (typeof param !== 'object') {
                param = null;
            }

            // 防止时间戳重复
            var callbackId = func + '_' + new Date().getTime() + (Math.random());
            if ('function' === typeof callback) {
                callbackPoll[callbackId] = callback;
            }

            if (param && param.callbackId) {
                // 从Native调用过来的请求，再回调到Native的callback里
                // TODO: 需要优化，这里调用回Native的callback不需要传入`handlerName`
                func = {
                    responseId: param.callbackId,
                    responseData: param
                };
                delete param.callbackId;
            } else {
                // 从页面直接发起到Native的请求
                func = {
                    handlerName: func,
                    data: param
                };
                func.callbackId = '' + callbackId;
            }

//            console.log('bridge.call: ' + JSON.stringify(func));
            sendMessageQueue.push(func);
            iframe.src = "alipaybridge://dispatch_message";
        },

        trigger: function (name, data) {
//            console.log('bridge.trigger ' + name);
            if (name) {
                var triggerEvent = function (name, data) {
                    var callbackId;
                    if (data && data.callbackId) {
                        callbackId = data.callbackId;
                        data.callbackId = null;
                    }
                    var evt = document.createEvent("Events");
                    evt.initEvent(name, false, true);
                    if (data) {
                        if (data.__pull__) {
                            delete data.__pull__;
                            for (var k in data) {
                                evt[k] = data[k];
                            }
                        } else {
                            evt.data = data;
                        }
                    }
                    var canceled = !document.dispatchEvent(evt);
                    if (callbackId) {
                        var callbackData = {};
                        callbackData.callbackId = callbackId;
                        callbackData[name + 'EventCanceled'] = canceled;
                        JSAPI.call('__nofunc__', callbackData);
                    }
                };
                setTimeout(function () {
                    triggerEvent(name, data);
                }, 1);
            }
        },

        /*
         * Native调用js函数，传输消息
         **/
        _invokeJS: function (resp) {
//            console.log('bridge._invokeJS: ' + resp);
            resp = JSON.parse(resp);
            if (resp.responseId) {
                var func = callbackPoll[resp.responseId];
                //某些情况需要多次回调，添加keepCallback标识，防删除
                if (!(typeof resp.keepCallback == 'boolean' && resp.keepCallback)) {
                    delete callbackPoll[resp.responseId];
                }

                if ('function' === typeof func) {
                    // 避免死锁问题
                    setTimeout(function () {
                        func(resp.responseData);
                    }, 1);
                }
            } else if (resp.handlerName) {

                if (resp.handlerName == "H5DynamicPluginCallback") {
                    // H5动态插件加载完成的回调
                    if (callbackPoll[resp.data.callbackId]) {
                        var func = callbackPoll[resp.data.callbackId];
                        if ('function' === typeof func) {
                            setTimeout(function () {
                                func();
                            }, 1);
                        }
                    }

                } else {
                    if (resp.callbackId) {
                        resp.data = resp.data || {};
                        resp.data.callbackId = resp.callbackId;
                    }
                    JSAPI.trigger(resp.handlerName, resp.data);
                }

            }
        },

        // ***********************************************
        // WebViewJSBridge.js库兼容 @远尘 2014.2.28

        _handleMessageFromObjC: function (message) {
            if (receiveMessageQueue) {
                receiveMessageQueue.push(message);
            } else {
                JSAPI._invokeJS(message);
            }
        },

        _fetchQueue: function () {
            var messageQueueString = JSON.stringify(sendMessageQueue);
            sendMessageQueue = [];
            return messageQueueString;
        },

        /**
         * 载入一个或多个动态插件，加载完成将触发回调
         *
         * @param {Array/String}  plugins   动态插件的地址，可以是一个或多个
         *                                  plugins格式说明：数组，包含单个插件地址的字符串
         * @param {Function}      callback  载入成功后的回调函数，一次加载多个插件时，只有当所有插件加载完成才会执行callback
         */
        loadPlugin: function (plugins, callback) {
            // only iOS platform
            if (navigator.userAgent.indexOf('iPhone') === -1 &&
                navigator.userAgent.indexOf('iPad') === -1 &&
                navigator.userAgent.indexOf('iPod') === -1) {
                return;
            }

            // 入栈
            H5_PLUGIN_STACK.push({
                'plugins': plugins,
                'callback': callback
            });

            if (!window.H5_PLUGIN_LOADER) {
                window.H5_PLUGIN_LOADER = setInterval(function () {
                    // 每隔50毫秒加载一个插件
                    var pluginsConfig = H5_PLUGIN_STACK.shift();
                    if (typeof pluginsConfig != 'undefined' && typeof pluginsConfig.plugins != 'undefined') {
                        var plugins = pluginsConfig.plugins;
                        var callback = pluginsConfig.callback;
                        var pluginArray = [];
                        if (Object.prototype.toString.call(plugins) === '[object Array]') {
                            for (var i = 0, l = plugins.length; i < l; i++) {
                                pluginArray.push(plugins[i]);
                            }
                        } else if (typeof plugins === 'string') {
                            pluginArray.push(plugins);
                        }

                        if (callback && typeof callback == 'function') {
                            var callbackId = H5_PLUGIN_CALLBACK_PREFIX + H5_PLUGIN_CALLBACK_UNIQUE_ID++;
                            callbackPoll[callbackId] = callback;
                            document.location.href = H5_PLUGIN_BASE_URL + encodeURIComponent(pluginArray.join(',')) +
                                '&callbackId=' + callbackId;
                        } else {
                            document.location.href = H5_PLUGIN_BASE_URL + encodeURIComponent(pluginArray.join(','));
                        }
                    } else {
                        window.clearInterval(window.H5_PLUGIN_LOADER);
                        window.H5_PLUGIN_LOADER = undefined;
                    }
                }, 50);
            }
        }
    };

    // ***********************************************

    // 初使化事件, 在webview didFinishLoad后调用
    JSAPI.init = function () {
        // dont call me any more
        JSAPI.init = null;

        //从全局对象中读取startupParams,确保ready中可用
        JSAPI.startupParams=window.ALIPAYH5STARTUPPARAMS||{};
        window.ALIPAYH5STARTUPPARAMS=null;

        //动态替换js片段，为了解决在AlipayJSBridge Ready中，使用新增的js属性，由内核替换为js片段字符串
        "H5_BRIDGE_JS_***_REPLACE_STRING_***_SJ_EGDIRB_5H";
        
        var readyEvent = document.createEvent('Events');
        readyEvent.initEvent('AlipayJSBridgeReady', false, false);

        // 处理ready事件发生以后才addEventListener的情况
        var docAddEventListener = document.addEventListener;
        document.addEventListener = function (name, func) {
            if (name === readyEvent.type) {
                // 保持func执行的异步性
                setTimeout(function () {
                    func(readyEvent);
                }, 1);
            } else {
                docAddEventListener.apply(document, arguments);
            }
        };

        document.dispatchEvent(readyEvent);

        var receivedMessages = receiveMessageQueue;
        receiveMessageQueue = null;
        for (var i = 0; i < receivedMessages.length; i++) {
            JSAPI._invokeJS(receivedMessages[i]);
        }
    };

    window.AlipayJSBridge = JSAPI;

    //jsbridge提前后，将webViewDidFinishLoad中init方法，提前到DOMReady后执行，避免由于长时间加载资源，而影响到接口调用
    onDOMReady(JSAPI.init);
    //注入外部需要的脚本
    onDOMReady(function(){
        if (window.ALIPAYH5DYNAMICSCRIPT&&/^([\w.+-]+:)(?:\/\/(?:[^\/?#]*@|)([^\/?#:]*)(?::(\d+)|)|)/.test(window.ALIPAYH5DYNAMICSCRIPT)){
            var script,head = document.head || document.documentElement;
            script=document.createElement("script");
            script.async = true;
            script.charset="UTF-8";
            script.src = window.ALIPAYH5DYNAMICSCRIPT;
            head.insertBefore(script,head.firstChild);
        };
    });
})();
