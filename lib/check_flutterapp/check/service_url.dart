

// base 地址
const String URL_BASE = "https://iot.sz-luoding.com:888/api/";
// content-type 用户登录
const String CONTENT_TYPE_USER_LOGIN = "user/login";
// content-type 项目列表
const String CONTENT_TYPE_PROJECT_LIST = "project/list";
// content-type 电箱路灯列表
const String CONTENT_TYPE_DEVICE_LAMP_LIST = "v_device_lamp/list";
// content-type 电箱列表
const String DEVICE_EBOX = "v_device_ebox/list";
// content-type 汇报设备配置
const String REPORT_CONFIG = "device/reportConfig";
// content-type 单个设备信息
const String VIEW_BY_UUID = "device/viewByUUID";
// content-type 获取断缆报警器列表
const String DEVICE_WIRESAFE_LIST ="v_device_wiresafe/list";
// content-type 设备控制
const String DEVICE_CONTROL ="device/control";


const ServiceUrl = 'http://test.baixingliangfan.cn/baixing/';
const servicePath = {
  'LOGIN_URl': URL_BASE + CONTENT_TYPE_USER_LOGIN, // 登录地址
  'PROJECT_LIST_URL':  URL_BASE + CONTENT_TYPE_PROJECT_LIST, // 获取项目列表地址
  'DEVICE_LAMP_LIST_URL': URL_BASE + CONTENT_TYPE_DEVICE_LAMP_LIST, // 获取项目下路灯地址
  'DEVICE_EBOX_URL':URL_BASE + DEVICE_EBOX, // 获取电箱列表地址
  'REPORT_CONFIG_URL': URL_BASE + REPORT_CONFIG, // 获取汇报设备配置地址
  'VIEW_BY_UUID_URL': URL_BASE + VIEW_BY_UUID, // 获取获取单个设备信息
  'DEVICE_WIRESAFE_LIST_URL': URL_BASE + DEVICE_WIRESAFE_LIST, // 获取断缆报警器列表
  'DEVICE_CONTROL_URL': URL_BASE + DEVICE_CONTROL, // 设备控制
};



