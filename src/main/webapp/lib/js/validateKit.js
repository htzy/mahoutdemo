/**
 * Created by 黄诗鹤 on 2015/3/22.
 */

/**
 * 检查数据是否为空
 * @param data 被测数据
 * @returns {boolean} null:false;not null:true;
 */
function isNull(data) {
    return !/[^(^\s*)|(\s*$)]/.test(data);
}
/**
 * 检查数据是否为数字
 * @param data 被测数据
 * @returns {boolean}
 */
function isNum(data) {
    return /^\d+$/.test(data);
    //return checkData(data,/^/d+(/.{1}/d+\)?$/);
}

/**
 * 检查数据是否为邮箱
 * @param data 被测数据
 * @returns {boolean}
 */
function isEmail(data) {
    return isLegal(data) && /^[^@]+@[^@]+\.[^@]+$/.test(data);
}

/**
 * 检查数据是否合法，这里指的是数字，字母，下划线,@,.同时不能为空
 * @param data 被测数据
 * @returns {boolean}
 */
function isLegal(data) {
    return /^[A-Za-z0-9_@.]+$/.test(data);
}

/**
 * 检查数据是否为中文或者合法数据
 * @param data 被测数据
 * @returns {boolean}
 */
function isChinese(data) {
    return /^[\u0391-\uFFE5A-Za-z0-9.,_@]+$/.test(data);
}

/**
 * is url?
 * @param data 被测数据
 * @returns {boolean}
 */
function isUrl(data) {
    return /^https:|http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/.test(data);
}


    /**
     * 数据检查
     * 出现的问题是reg参数传递出现问题，多一次函数调用效率会高？
     */
    function checkData(data, reg) {
        return reg.test(data);
    }

