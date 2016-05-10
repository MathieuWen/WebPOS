/*---------------------------------------------------------------------------------------------------------------
 *		Asda 專用 函式 / 物件:method 庫
 *		使用方式:  var  a = 'Mathieu.Wen@gmail.com';
 *						    if( a.is_mail() ) alert('是信箱');
 *                              if( ('81538810').is_taxid() ) alert('是統編');
 *----------------------------------------------------------------------------------------------------------------*/
 /*
 (function(_jQueryInit){
     jQuery.fn.init = function(selector, context) {
        return (jQuery._this = new _jQueryInit(selector, context));
    };
})(jQuery.fn.init);
 */
Function.prototype.method = function(name, func){
	this.prototype[name] = func;
	return this;
}

Object.size = function(obj) {
   var size = 0, key;
   for (key in obj) {
      if (obj.hasOwnProperty(key)) size++;
   }
   return size;
};
 
String.prototype.toComma = function() {return this.replace(/\s\-\:/g, ',');}
String.prototype.Trim = function() {return this.replace(/(^\s*)|(\s*$)/g, '');} 
String.prototype.str2no=function(){return this.replace(/[^0-9]/g,'');}
String.prototype.toInt=function(){return parseInt(this, 10);}
Number.prototype.toInt=function(){return parseInt(this, 10);}
String.prototype.toBool=function(){
   switch(this.toString().toLowerCase()){
      case "true": case "1": return true;
      case "false": case "0": case null: return false;
      default: return Boolean(this);
   }
}
Number.prototype.toBool=function(){
   switch(this.toString().toLowerCase()){
      case "true": case "1": return true;
      case "false": case "0": case null: return false;
      default: return Boolean(this);
   }
}

Number.prototype.toBin = function(){return this.toString(2);}
String.prototype.toBin = function(){return parseInt(this, 10).toString(2);}


String.prototype.right= function(bit){return this.slice(this.length-bit, this.length);}
 
String.prototype.left= function(bit){return this.slice(0, bit);}

String.prototype.pickbinary= function(bit){return parseInt(this.substr(this.length-bit, 1), 10);}

var is_number = function(str){return (/^-?\d+(?:\.\d*)?(?:e[+\-]?\d+)?$/i).test(str);}
var DateDiff = function (sDate1, sDate2){
    var aDate, oDate1, oDate2;
    aDate = sDate1.split("-");
    oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
    aDate = sDate2.split("-");
    oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
    return parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 /24, 10);
}

var padLeft = function(str, lenght) {return (str.length >= lenght) ? str : padLeft("0" + str, lenght);}

var is_array = function(val){
	return val && typeof val === 'object' &&
				typeof val.length === 'number' &&
				typeof val.splice === 'function' &&
				!(val.propertyIsEnumerable('length'));
}
 //	數字驗證 ( 包含 - 號, 小數點, e)
String.prototype.is_numberic = function(){return (/^-?\d+(?:\.\d*)?(?:e[+\-]?\d+)?$/i).test(this);}
//		布林驗證
String.prototype.is_bool = function(){return (/^true$/i).test(this);}
//		信箱驗證
String.prototype.is_mail = function(){return (/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z-]+)$/i).test(this);}
//		手機驗證 (台灣區 )
String.prototype.is_mobile = function(){return (/^09\d{8}$/).test(this);}
//		統編驗證 (台灣區)
String.prototype.is_taxid = function(){
//	if((/\d{8}$/).test(this)) return false;
	if(isNaN(this)) return false;	
	var strValid = '12121241';
	for(var i = 0, tmp = 0; i<this.length; i++){
		var subtotal = this.charAt(i)*strValid.charAt(i); 
		tmp += (Math.floor(subtotal/10)+subtotal%10);
	}
	return ((tmp%10 == 0 || (tmp%10==9 && this.charAt(6) == '7') ) && i==8) ? true : false;
}
//		身分証驗證
String.prototype.is_pid = function() {
	var pid = (this).Trim().toUpperCase(); 
	if(!(/^[A-Z]{1}[12]{1}\d{8}$/).test(pid)) return false;
	var strValid='BAKJHGFEDCNMLVUTSRQPZWYX0000OI';
	var d1 = strValid.indexOf( pid.charAt(0) ) % 10;
	for(var i =1, tmp = 0; i < 9; i++){
		tmp += pid.charAt(i) * ( 9 - i );
	}
	tmp += d1 + parseInt(pid.charAt(9), 10);
	return (tmp %10) ? false : true;
}
//		信用卡驗證
String.prototype.is_credit = function(){
	if((/\D{16}$/).test(this)) return false;
	for(var i = 0, tmp = 0; i < 16; i++){
		tmp += (i&1) ? ( Math.floor(this.charAt(i)*1/10) + this.charAt(i)*1%10 ) : ( Math.floor(this.charAt(i)*2/10) + this.charAt(i)*2%10 );
	}
	return ( tmp%10 ) ? false : true;
}

String.prototype.Bytelength = function() {
    var txt = this.match(/[^\x00-\xff]/ig);
    return  txt == null ? this.length : this.length + txt.length;
}

String.prototype.is_birth = function(remainder){
		var RightNow = new Date();
		var Nowmonth = parseInt((RightNow.getMonth()+1), 10).toString(), Nowdate = RightNow.getDate().toString();
		var birthyear = this.substr(0,4), birthmonth = this.substr(5,2), birthday = this.substr(8,2);
		var diff = DateDiff(birthyear+'-'+Nowmonth+'-'+Nowdate, this);
		var daydiff = parseInt((Nowmonth+Nowdate), 10) - parseInt(birthmonth+birthday, 10);
		remainder = parseInt(remainder, 10) || 0 ;
		return ( remainder >= diff && daydiff >= 0  ) ? true : false;
}

$.fn.serializeObject = function(){
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name] !== undefined) {
			if (!o[this.name].push) {
				o[this.name] = [o[this.name]];
			}
			o[this.name].push(this.value || '');
		}else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};

function str_pad(input, pad_length, pad_string, pad_type){
    var half = '', pad_to_go;
    var str_pad_repeater = function (s, len){
        var collect = '', i;
        while (collect.length < len) {
            collect += s;
        }
        collect = collect.substr(0, len);
        return collect;
    };

    input += '';
    pad_string = pad_string !== undefined ? pad_string : ' ';
   
    if (pad_type != 'STR_PAD_LEFT' && pad_type != 'STR_PAD_RIGHT' && pad_type != 'STR_PAD_BOTH' || pad_type===undefined) {
        pad_type = 'STR_PAD_LEFT';
    }
    if ((pad_to_go = pad_length - input.length) > 0) {
        if (pad_type == 'STR_PAD_LEFT') {
            input = str_pad_repeater(pad_string, pad_to_go) + input;
        } else if (pad_type == 'STR_PAD_RIGHT') {
            input = input + str_pad_repeater(pad_string, pad_to_go);
        } else if (pad_type == 'STR_PAD_BOTH') {
            half = str_pad_repeater(pad_string, Math.ceil(pad_to_go / 2));
            input = half + input + half;
            input = input.substr(0, pad_length);
        }
    }

    return input;
}


   /*
	* @param string str 為原始字串
	* @param string txt 為更改字串
	* @param int times 為大於指定數的次數
	* @param int max 為最大長度
	* @param int i 為起始位置
	* @param string add 為增加字串
	* @return string 為更改完成的字串
	* ex:
	*			item_length = (item).length;
	*			var times = (item_length%22) ? Math.ceil(item_length / 22) : (Math.ceil(item_length /22)-1);
	*			item_name = item_makeup(item, '', times, 12, 0, '\\br_');
	*/

function item_makeup(str, txt, times, max, i, add){
	if(times){
		txt += (str.substr(i, max)+add);
		return item_makeup(str, txt, times-1, max, i+max, add);
	}else{
		txt += str.substr(i, (str.length-i)+1);
		return txt;
	}
}

function telmkup(telno){
   return telno.replace(/[\D]/g, '').replace(/^(02|037|03|049|04|05|06|07|0836|089|082|08|09)(\d{1,})$/g, function(){
      return (new String()).concat('NO.', arguments[1], arguments[2]);
   });
}
   /*
	* @param string name 為cookie名
	* @param string value 為cookie值
	* @param object options 為cookie設定
	* @options param int expires 為cookie expires
	* @options param str path 為cookie 位置
	* ex:
	*	設定 example 為 foo  
	*		$.cookie("example", "foo");   
	*	設定 example 為 foo 且存活7天  
	*		$.cookie("example", "foo", { expires: 7 });   
	*	設定 example 為 foo cookie 存活7天 且cooke path為 /admin  
	*		$.cookie("example", "foo", { path: '/admin', expires: 7 });  
	*	取得example的值  
	*		$.cookie("example");
	*	刪除example  
	*		$.cookie("example", null);
	*/
jQuery.cookie = function(name, value, options){
    if (typeof value != 'undefined'){
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString();
        }

        var path = options.path ? '; path=' + (options.path) : '';
        var domain = options.domain ? '; domain=' + (options.domain) : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    }else{
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
};

function Max(){
   return Array.prototype.slice.call(arguments, 0).sort((function(a, b){return a - b;})).pop();
}

function Min(){
   return Array.prototype.slice.call(arguments, 0).sort((function(a, b){return a - b;})).shift();
}

function delayExecute(check, proc, chkInterval){
   var x = chkInterval || 10;
   var hnd = window.setInterval(function(){
      if(check()){
         window.clearInterval(hnd);
         proc();
      }
   }, x);
}

function multiplereplace(str, obj){
   for(var key in obj){
      if(obj.hasOwnProperty(key)){
         str = str.replace(new RegExp(key, 'gi'), obj[key]);
      }
   }
   return str;
}

function addchar(num, chars){
	for(var txt ='', i=0;i<num;i++,txt += chars);
	return txt;
}

function in_array(needle, haystack, argStrict) {
    var key = '', strict = !! argStrict;
        
    if (strict) {
        for (key in haystack) {
            if (haystack[key] === needle) {
                return true;
            }
        }
    } else {
        for (key in haystack) {
            if (haystack[key] == needle) {
                return true;
            }
        }
    }

    return false;
}

function method_exists (obj, method){
   if (typeof obj === 'string') {
      return this.window[obj] && typeof this.window[obj][method] === 'function';
   }
   return typeof obj[method] === 'function';
}

function function_exists (func_name) {
   if (typeof func_name === 'string') {
      func_name = this.window[func_name];
   }
   return typeof func_name === 'function';
}

function class_exists(cls){
   var i = '';
   cls = this.window[cls];
   if (typeof cls !== 'function') {
      return false;
   }

   for(i in cls.prototype){
      return true;
   }
   
   for(i in cls){
      if (i !== 'prototype') {
         return true;
      }
   }
   
   if (cls.toSource && cls.toSource().match(/this\./)) {
      return true;
   }
   
   return false;
}

function empty(mixed_var) {
   var key;
   if (mixed_var === "" || mixed_var === 0 || mixed_var === "0" || mixed_var === null || mixed_var === false || typeof mixed_var === 'undefined') {
      return true;
   }

   if (typeof mixed_var == 'object') {
      for (key in mixed_var) {
         return false;
      }
      return true;
   }

   return false;
}

function isset(){
   var a = arguments, l = a.length, i = 0, undef;

   if (l === 0) {
      return false;
      //throw new Error('Empty isset');
   }

   while (i !== l) {
      if (a[i] === undef || a[i] === null) {
         return false;
      }
      i++;
   }
   return true;
}

function strcasecmp(f_string1, f_string2) {
   var string1 = (f_string1 + '').toLowerCase();
   var string2 = (f_string2 + '').toLowerCase();

   if (string1 > string2) {
      return 1;
   }else if (string1 == string2) {
      return 0;
   }

   return -1;
}

function defined (constant_name) {
   var tmp = this.window[constant_name];
   this.window[constant_name] = this.window[constant_name] ? 'changed' + this.window[constant_name].toString() : 'changed';
   var returnval = this.window[constant_name] === tmp;
   if (!returnval) { // Reset
      this.window[constant_name] = tmp;
   }
   return returnval;
}

function define(name, value){
   var defn, replace, script, that = this, d = this.window.document;
   var toString = function (name, value) {
      return 'const ' + name + '=' + (/^(null|true|false|(\+|\-)?\d+(\.\d+)?)$/.test(value = String(value)) ? value : '"' + replace(value) + '"');
   };
   try {
      eval('const e=1');
      replace = function (value) {
         var replace = {
            "\x08": "b",
            "\x0A": "\\n",
            "\x0B": "v",
            "\x0C": "f",
            "\x0D": "\\r",
            '"': '"',
            "\\": "\\"
         };
         return value.replace(/\x08|[\x0A-\x0D]|"|\\/g, function (value) {
             return "\\" + replace[value];
         });
      };
      defn = function (name, value) {
         script = d.createElement('script');
         script.type = 'text/javascript';
         script.appendChild(d.createTextNode(toString(name, value)));
         d.documentElement.appendChild(script);
         d.documentElement.removeChild(script);
      };
   }catch (e){
         replace = function (value) {
            var replace = {
               "\x0A": "\\n",
               "\x0D": "\\r"
            };
            return value.replace(/"/g, '""').replace(/\n|\r/g, function (value) {
               return replace[value];
            });
        };
        
      defn = function (name, value) {
         eval(toString(name, value).substring(6));
      };
   }
   
   defn(name, value);
}

function uniqid (prefix, more_entropy) {
   if (typeof prefix == 'undefined') {
      prefix = "";
   }

    var retId;
    var formatSeed = function (seed, reqWidth) {
        seed = parseInt(seed, 10).toString(16); // to hex str
        if (reqWidth < seed.length) { // so long we split
            return seed.slice(seed.length - reqWidth);
        }
        if (reqWidth > seed.length) { // so short we pad
            return Array(1 + (reqWidth - seed.length)).join('0') + seed;
        }
        return seed;
    };

   if (!this.php_js) {
      this.php_js = {};
   }

   if (!this.php_js.uniqidSeed){
      this.php_js.uniqidSeed = Math.floor(Math.random() * 0x75bcd15);
   }
   this.php_js.uniqidSeed++;

   retId = prefix;
   retId += formatSeed(parseInt(new Date().getTime() / 1000, 10), 8);
   retId += formatSeed(this.php_js.uniqidSeed, 5);
   if (more_entropy) {
      retId += (Math.random() * 10).toFixed(8).toString();
   }

    return retId;
}

function ini_set (varname, newvalue){
   var oldval = '', that = this;
   this.php_js = this.php_js || {};
   this.php_js.ini = this.php_js.ini || {};
   this.php_js.ini[varname] = this.php_js.ini[varname] || {};
   oldval = this.php_js.ini[varname].local_value;

   var _setArr = function (oldval) { // Although these are set individually, they are all accumulated
      if (typeof oldval === 'undefined') {
         that.php_js.ini[varname].local_value = [];
      }
         that.php_js.ini[varname].local_value.push(newvalue);
   };

   switch (varname) {
    case 'extension':
        if (typeof this.dl === 'function') {
            this.dl(newvalue); // This function is only experimental in php.js
        }
        _setArr(oldval, newvalue);
        break;
    default:
        this.php_js.ini[varname].local_value = newvalue;
        break;
    }
    return oldval;
}

function error_reporting (level) {
    // *     example 1: error_reporting(1);
    // *     returns 1: 6135
   return this.ini_set('error_reporting', level);
}
function error_get_last () {
    // *     example 1: error_get_last();
    // *     returns 1: null
    // *     example 2: error_get_last();
    // *     returns 2: {type: 256, message: 'My user error', file: 'C:\WWW\index.php', line: 2}

    return this.php_js && this.php_js.last_error ? this.php_js.last_error : null; // Only set if error triggered within at() or trigger_error()
}

function trigger_error (error_msg, error_type) {
    // Fix: get to work with set_error_handler()'s handler when that is added
   var type = 0, i = 0, that = this, prepend = '', append = '';
   if (!error_type){
      error_type = 'E_USER_NOTICE';
   }
    var ini_on = function (ini) {
        return that.php_js.ini[ini] && that.php_js.ini[ini].local_value && ((that.php_js.ini[ini].local_value.toString && that.php_js.ini[ini].local_value.toString().toLowerCase && (that.php_js.ini[ini].local_value.toString().toLowerCase() === 'on' || that.php_js.ini[ini].local_value.toString().toLowerCase() === 'true')) || parseInt(that.php_js.ini[ini].local_value, 10) === 1);
    };
    var display_errors = function (type) {
        return that.php_js.ini.error_reporting && (type & that.php_js.ini.error_reporting.local_value) && ini_on('display_errors');
    };
    var TYPES = { // Including all types for completeness, but should not trigger aggregates like E_STRICT or E_ALL
        E_ERROR: 1,
        // Fatal run-time errors. These indicate errors that can not be recovered from, such as a memory allocation problem. Execution of the script is halted.
        E_WARNING: 2,
        // Run-time warnings (non-fatal errors). Execution of the script is not halted.
        E_PARSE: 4,
        // Compile-time parse errors. Parse errors should only be generated by the parser.
        E_NOTICE: 8,
        // Run-time notices. Indicate that the script encountered something that could indicate an error, but could also happen in the normal course of running a script.
        E_CORE_ERROR: 16,
        // Fatal errors that occur during PHP's initial startup. This is like an E_ERROR, except it is generated by the core of PHP.
        E_CORE_WARNING: 32,
        // Warnings (non-fatal errors) that occur during PHP's initial startup. This is like an E_WARNING, except it is generated by the core of PHP.
        E_COMPILE_ERROR: 64,
        // Fatal compile-time errors. This is like an E_ERROR, except it is generated by the Zend Scripting Engine.
        E_COMPILE_WARNING: 128,
        // Compile-time warnings (non-fatal errors). This is like an E_WARNING, except it is generated by the Zend Scripting Engine.
        E_USER_ERROR: 256,
        // User-generated error message. This is like an E_ERROR, except it is generated in PHP code by using the PHP function trigger_error().
        E_USER_WARNING: 512,
        // User-generated warning message. This is like an E_WARNING, except it is generated in PHP code by using the PHP function trigger_error().
        E_USER_NOTICE: 1024,
        // User-generated notice message. This is like an E_NOTICE, except it is generated in PHP code by using the PHP function trigger_error().
        E_STRICT: 2048,
        // Enable to have PHP suggest changes to your code which will ensure the best interoperability and forward compatibility of your code.
        E_RECOVERABLE_ERROR: 4096,
        // Catchable fatal error. It indicates that a probably dangerous error occured, but did not leave the Engine in an unstable state. If the error is not caught by a user defined handle (see also set_error_handler()), the application aborts as it was an E_ERROR.
        E_DEPRECATED: 8192,
        // Run-time notices. Enable this to receive warnings about code that will not work in future versions.
        E_USER_DEPRECATED: 16384,
        // User-generated warning message. This is like an E_DEPRECATED, except it is generated in PHP code by using the PHP function trigger_error().
        E_ALL: 30719 // All errors and warnings, as supported, except of level E_STRICT in PHP < 6.     in:32767, // PHP 6, in:30719, // PHP 5.3.x, in:6143, // PHP 5.2.x, previously:2047, //
    };
    if (typeof error_type === 'number') {
        type = error_type;
    } else { // Allow for a single string or an array of string flags
        error_type = [].concat(error_type);
        for (i = 0; i < error_type.length; i++) {
            // Resolve string input to bitwise
            if (TYPES[error_type[i]]) {
                type = type | TYPES[error_type[i]];
            }
        }
    }
    // BEGIN REDUNDANT
    this.php_js = this.php_js || {};
    this.php_js.ini = this.php_js.ini || {};
    // END REDUNDANT
    if (type & TYPES.E_USER_ERROR || type & TYPES.E_ERROR || type & TYPES.E_CORE_ERROR || type & TYPES.E_COMPILE_ERROR || type & TYPES.E_RECOVERABLE_ERROR || type & TYPES.E_PARSE) {
        if (ini_on('track_errors')) {
            this.$php_errormsg = error_msg; // Can assign to this global, as in PHP (see http://php.net/manual/en/reserved.variables.phperrormsg.php )
        }
        if (display_errors(type)) {
            prepend = this.php_js.ini.error_prepend_string ? this.php_js.ini.error_prepend_string : '';
            append = this.php_js.ini.error_append_string ? this.php_js.ini.error_append_string : '';
            console.log(prepend + 'Error: ' + error_msg + ' ' + append);
        }
        var e = new Error(error_msg); // Might, for Mozilla, allow to somehow pass in a fileName and lineNumber (2nd and 3rd arguments to Error)
        e.type = type;
        this.php_js.last_error = {
            message: e.message,
            file: e.fileName,
            line: e.lineNumber,
            type: e.type
        }; // fileName and lineNumber presently not working (see note just above)
        throw e;
    }

    if (display_errors(type)) {
        switch (type) {
        case TYPES.E_USER_WARNING:
        case TYPES.E_WARNING:
        case TYPES.E_CORE_WARNING:
        case TYPES.E_COMPILE_WARNING:
            console.log('Warning: ' + error_msg);
            break;
        case TYPES.E_USER_NOTICE:
        case TYPES.E_NOTICE:
            console.log('Notice: ' + error_msg);
            break;
        case TYPES.E_DEPRECATED:
        case TYPES.E_USER_DEPRECATED:
            console.log('Deprecated: ' + error_msg);
            break;
        default:
            throw 'Unrecognized error type';
        }
    }

    return true;
}

function user_error (error_msg, error_type) {
   return this.trigger_error(error_msg, error_type);
}
