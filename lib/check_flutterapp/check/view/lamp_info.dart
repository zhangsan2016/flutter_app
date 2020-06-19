class LampInfo {
  var errno;
  String errmsg;
  Data data;

  LampInfo({this.errno, this.errmsg, this.data});

  LampInfo.fromJson(Map<String, dynamic> json) {
    errno = json['errno'];
    errmsg = json['errmsg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errno'] = this.errno;
    data['errmsg'] = this.errmsg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  var count;
  var totalPages;
  var pageSize;
  var currentPage;
  List<Lamp> lamp;

  Data(
      {this.count,
        this.totalPages,
        this.pageSize,
        this.currentPage,
        this.lamp});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    totalPages = json['totalPages'];
    pageSize = json['pageSize'];
    currentPage = json['currentPage'];
    if (json['data'] != null) {
      lamp = new List<Lamp>();
      json['data'].forEach((v) {
        lamp.add(new Lamp.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['totalPages'] = this.totalPages;
    data['pageSize'] = this.pageSize;
    data['currentPage'] = this.currentPage;
    if (this.lamp != null) {
      data['lamp'] = this.lamp.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lamp {
  String uUID;
  String lAT;
  String lNG;
  String nAME;
  var tYPE;
  String pROJECT;
  String sUBGROUP;
  var iId;
  String fUUID;
  String smsphone;
  String subgroups;
  String admin;
  Null config;
  String reportConfig;
  String lampDiameter;
  String powerManufacturer;
  String lampRatedCurrent;
  String lampRatedvoltage;
  String lampType;
  String lampManufacturer;
  String lampNum;
  String poleProductionDate;
  String poleHeight;
  String ratedPower;
  String subcommunicateMode;
  var sTATE;
  var current;
  var power;
  var leakCurt;
  var gprsCsq;
  var illu;
  var powerFactor;
  var temp;
  var energy;
  var voltage;
  var tsMqtt;
  var rESETCOUNT;
  String version;
  double lbsLongitude;
  double lbsLatitude;
  var firDimming;
  var dimmingLock;
  var secDimming;
  var dimming;
  var angleCalibrate;
  var warningState;
  var senserFault;
  String alarmLightMode;
  String sUBID1;
  double longitude;
  double latitude;
  var secTpFir;
  var thirTpFir;
  String firTtFir;
  String secTtFir;
  var fifTpFir;
  var firTpFir;
  String fifTtFir;
  var fourTpFir;
  String fourTtFir;
  String sixTtFir;
  String thirTtFir;
  var sixTpFir;
  String secTtSec;
  var fourTpSec;
  var thirTpSec;
  String fourTtSec;
  String thirTtSec;
  String firTtSec;
  String sixTtSec;
  var firTpSec;
  var sixTpSec;
  String fifTtSec;
  var fifTpSec;
  var secTpSec;
  var vDownthreshold;
  var cDownthreshold;
  var cUpthreshold;
  var vUpthreshold;
  var leakCThreshold;
  var leakCEnable;
  var overCurrentEnable;
  var illuLightEnable;
  var degWarningEnable;
  var alarmEnable;
  String msg;
  String time;
  String voc;
  String pm25;
  var hum;
  var iRDimmingEn;

  Lamp(
      {this.uUID,
        this.lAT,
        this.lNG,
        this.nAME,
        this.tYPE,
        this.pROJECT,
        this.sUBGROUP,
        this.iId,
        this.fUUID,
        this.smsphone,
        this.subgroups,
        this.admin,
        this.config,
        this.reportConfig,
        this.lampDiameter,
        this.powerManufacturer,
        this.lampRatedCurrent,
        this.lampRatedvoltage,
        this.lampType,
        this.lampManufacturer,
        this.lampNum,
        this.poleProductionDate,
        this.poleHeight,
        this.ratedPower,
        this.subcommunicateMode,
        this.sTATE,
        this.current,
        this.power,
        this.leakCurt,
        this.gprsCsq,
        this.illu,
        this.powerFactor,
        this.temp,
        this.energy,
        this.voltage,
        this.tsMqtt,
        this.rESETCOUNT,
        this.version,
        this.lbsLongitude,
        this.lbsLatitude,
        this.firDimming,
        this.dimmingLock,
        this.secDimming,
        this.dimming,
        this.angleCalibrate,
        this.warningState,
        this.senserFault,
        this.alarmLightMode,
        this.sUBID1,
        this.longitude,
        this.latitude,
        this.secTpFir,
        this.thirTpFir,
        this.firTtFir,
        this.secTtFir,
        this.fifTpFir,
        this.firTpFir,
        this.fifTtFir,
        this.fourTpFir,
        this.fourTtFir,
        this.sixTtFir,
        this.thirTtFir,
        this.sixTpFir,
        this.secTtSec,
        this.fourTpSec,
        this.thirTpSec,
        this.fourTtSec,
        this.thirTtSec,
        this.firTtSec,
        this.sixTtSec,
        this.firTpSec,
        this.sixTpSec,
        this.fifTtSec,
        this.fifTpSec,
        this.secTpSec,
        this.vDownthreshold,
        this.cDownthreshold,
        this.cUpthreshold,
        this.vUpthreshold,
        this.leakCThreshold,
        this.leakCEnable,
        this.overCurrentEnable,
        this.illuLightEnable,
        this.degWarningEnable,
        this.alarmEnable,
        this.msg,
        this.time,
        this.voc,
        this.pm25,
        this.hum,
        this.iRDimmingEn});

  Lamp.fromJson(Map<String, dynamic> json) {
    uUID = json['UUID'];
    lAT = json['LAT'];
    lNG = json['LNG'];
    nAME = json['NAME'];
    tYPE = json['TYPE'];
    pROJECT = json['PROJECT'];
    sUBGROUP = json['SUBGROUP'];
    iId = json['_id'];
    fUUID = json['FUUID'];
    smsphone = json['smsphone'];
    subgroups = json['subgroups'];
    admin = json['admin'];
    config = json['config'];
    reportConfig = json['report_config'];
    lampDiameter = json['LampDiameter'];
    powerManufacturer = json['Power_Manufacturer'];
    lampRatedCurrent = json['Lamp_RatedCurrent'];
    lampRatedvoltage = json['Lamp_Ratedvoltage'];
    lampType = json['lampType'];
    lampManufacturer = json['Lamp_Manufacturer'];
    lampNum = json['Lamp_Num'];
    poleProductionDate = json['PoleProductionDate'];
    poleHeight = json['Pole_height'];
    ratedPower = json['Rated_power'];
    subcommunicateMode = json['Subcommunicate_mode'];
    sTATE = json['STATE'];
    current = json['Current'];
    power = json['Power'];
    leakCurt = json['Leak_curt'];
    gprsCsq = json['Gprs_csq'];
    illu = json['Illu'];
    powerFactor = json['Power_Factor'];
    //  powerFactor =  double.parse(json['Power_Factor']);
  //  powerFactor = json['Power_Factor'] is String ? double.parse(json['Power_Factor']) : json['Power_Factor'];
    temp = json['Temp'];
    energy = json['Energy'];
    voltage = json['Voltage'];
    tsMqtt = json['ts_mqtt'];
    rESETCOUNT = json['RESET_COUNT'];
    version = json['Version'];
    lbsLongitude = json['lbsLongitude'];
    lbsLatitude = json['lbsLatitude'];
    firDimming = json['FirDimming'];
    dimmingLock = json['Dimming_Lock'];
    secDimming = json['SecDimming'];
    dimming = json['Dimming'];
    angleCalibrate = json['Angle_calibrate'];
    warningState = json['Warning_state'];
    senserFault = json['Senser_Fault'];
    alarmLightMode = json['Alarm_Light_Mode'];
    sUBID1 = json['SUBID1'];
    time = json['Time'];
    longitude = json['Longitude'];
    latitude = json['Latitude'];
    secTpFir = json['Sec_tp_Fir'];
    thirTpFir = json['Thir_tp_Fir'];
    firTtFir = json['Fir_tt_Fir'];
    secTtFir = json['Sec_tt_Fir'];
    fifTpFir = json['Fif_tp_Fir'];
    firTpFir = json['Fir_tp_Fir'];
    fifTtFir = json['Fif_tt_Fir'];
    fourTpFir = json['Four_tp_Fir'];
    fourTtFir = json['Four_tt_Fir'];
    sixTtFir = json['Six_tt_Fir'];
    thirTtFir = json['Thir_tt_Fir'];
    sixTpFir = json['Six_tp_Fir'];
    secTtSec = json['Sec_tt_Sec'];
    fourTpSec = json['Four_tp_Sec'];
    thirTpSec = json['Thir_tp_Sec'];
    fourTtSec = json['Four_tt_Sec'];
    thirTtSec = json['Thir_tt_Sec'];
    firTtSec = json['Fir_tt_Sec'];
    sixTtSec = json['Six_tt_Sec'];
    firTpSec = json['Fir_tp_Sec'];
    sixTpSec = json['Six_tp_Sec'];
    fifTtSec = json['Fif_tt_Sec'];
    fifTpSec = json['Fif_tp_Sec'];
    secTpSec = json['Sec_tp_Sec'];
    vDownthreshold = json['V_downthreshold'];
    cDownthreshold = json['C_downthreshold'];
    cUpthreshold = json['C_upthreshold'];
    vUpthreshold = json['V_upthreshold'];
    leakCThreshold = json['Leak_c_threshold'];
    leakCEnable = json['Leak_c_enable'];
    overCurrentEnable = json['Over_Current_enable'];
    illuLightEnable = json['Illu_Light_Enable'];
    degWarningEnable = json['Deg_Warning_Enable'];
    alarmEnable = json['Alarm_enable'];
    msg = json['msg'];
    voc = json['voc'];
    pm25 = json['pm25'];
    hum = json['Hum'];
    iRDimmingEn = json['IR_Dimming_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UUID'] = this.uUID;
    data['LAT'] = this.lAT;
    data['LNG'] = this.lNG;
    data['NAME'] = this.nAME;
    data['TYPE'] = this.tYPE;
    data['PROJECT'] = this.pROJECT;
    data['SUBGROUP'] = this.sUBGROUP;
    data['_id'] = this.iId;
    data['FUUID'] = this.fUUID;
    data['smsphone'] = this.smsphone;
    data['subgroups'] = this.subgroups;
    data['admin'] = this.admin;
    data['config'] = this.config;
    data['report_config'] = this.reportConfig;
    data['LampDiameter'] = this.lampDiameter;
    data['Power_Manufacturer'] = this.powerManufacturer;
    data['Lamp_RatedCurrent'] = this.lampRatedCurrent;
    data['Lamp_Ratedvoltage'] = this.lampRatedvoltage;
    data['lampType'] = this.lampType;
    data['Lamp_Manufacturer'] = this.lampManufacturer;
    data['Lamp_Num'] = this.lampNum;
    data['PoleProductionDate'] = this.poleProductionDate;
    data['Pole_height'] = this.poleHeight;
    data['Rated_power'] = this.ratedPower;
    data['Subcommunicate_mode'] = this.subcommunicateMode;
    data['STATE'] = this.sTATE;
    data['Current'] = this.current;
    data['Power'] = this.power;
    data['Leak_curt'] = this.leakCurt;
    data['Gprs_csq'] = this.gprsCsq;
    data['Illu'] = this.illu;
    data['Power_Factor'] = this.powerFactor;
    data['Temp'] = this.temp;
    data['Energy'] = this.energy;
    data['Voltage'] = this.voltage;
    data['ts_mqtt'] = this.tsMqtt;
    data['RESET_COUNT'] = this.rESETCOUNT;
    data['Version'] = this.version;
    data['lbsLongitude'] = this.lbsLongitude;
    data['lbsLatitude'] = this.lbsLatitude;
    data['FirDimming'] = this.firDimming;
    data['Dimming_Lock'] = this.dimmingLock;
    data['SecDimming'] = this.secDimming;
    data['Dimming'] = this.dimming;
    data['Angle_calibrate'] = this.angleCalibrate;
    data['Warning_state'] = this.warningState;
    data['Senser_Fault'] = this.senserFault;
    data['Alarm_Light_Mode'] = this.alarmLightMode;
    data['SUBID1'] = this.sUBID1;
    data['Time'] = this.time;
    data['Longitude'] = this.longitude;
    data['Latitude'] = this.latitude;
    data['Sec_tp_Fir'] = this.secTpFir;
    data['Thir_tp_Fir'] = this.thirTpFir;
    data['Fir_tt_Fir'] = this.firTtFir;
    data['Sec_tt_Fir'] = this.secTtFir;
    data['Fif_tp_Fir'] = this.fifTpFir;
    data['Fir_tp_Fir'] = this.firTpFir;
    data['Fif_tt_Fir'] = this.fifTtFir;
    data['Four_tp_Fir'] = this.fourTpFir;
    data['Four_tt_Fir'] = this.fourTtFir;
    data['Six_tt_Fir'] = this.sixTtFir;
    data['Thir_tt_Fir'] = this.thirTtFir;
    data['Six_tp_Fir'] = this.sixTpFir;
    data['Sec_tt_Sec'] = this.secTtSec;
    data['Four_tp_Sec'] = this.fourTpSec;
    data['Thir_tp_Sec'] = this.thirTpSec;
    data['Four_tt_Sec'] = this.fourTtSec;
    data['Thir_tt_Sec'] = this.thirTtSec;
    data['Fir_tt_Sec'] = this.firTtSec;
    data['Six_tt_Sec'] = this.sixTtSec;
    data['Fir_tp_Sec'] = this.firTpSec;
    data['Six_tp_Sec'] = this.sixTpSec;
    data['Fif_tt_Sec'] = this.fifTtSec;
    data['Fif_tp_Sec'] = this.fifTpSec;
    data['Sec_tp_Sec'] = this.secTpSec;
    data['V_downthreshold'] = this.vDownthreshold;
    data['C_downthreshold'] = this.cDownthreshold;
    data['C_upthreshold'] = this.cUpthreshold;
    data['V_upthreshold'] = this.vUpthreshold;
    data['Leak_c_threshold'] = this.leakCThreshold;
    data['Leak_c_enable'] = this.leakCEnable;
    data['Over_Current_enable'] = this.overCurrentEnable;
    data['Illu_Light_Enable'] = this.illuLightEnable;
    data['Deg_Warning_Enable'] = this.degWarningEnable;
    data['Alarm_enable'] = this.alarmEnable;
    data['msg'] = this.msg;
    data['time'] = this.time;
    data['voc'] = this.voc;
    data['pm25'] = this.pm25;
    data['Hum'] = this.hum;
    data['IR_Dimming_en'] = this.iRDimmingEn;
    return data;
  }

  @override
  String toString() {
    return 'Lamp{uUID: $uUID, lAT: $lAT, lNG: $lNG, nAME: $nAME, tYPE: $tYPE, pROJECT: $pROJECT, sUBGROUP: $sUBGROUP, iId: $iId, fUUID: $fUUID, smsphone: $smsphone, subgroups: $subgroups, admin: $admin, config: $config, reportConfig: $reportConfig, lampDiameter: $lampDiameter, powerManufacturer: $powerManufacturer, lampRatedCurrent: $lampRatedCurrent, lampRatedvoltage: $lampRatedvoltage, lampType: $lampType, lampManufacturer: $lampManufacturer, lampNum: $lampNum, poleProductionDate: $poleProductionDate, poleHeight: $poleHeight, ratedPower: $ratedPower, subcommunicateMode: $subcommunicateMode, sTATE: $sTATE, current: $current, power: $power, leakCurt: $leakCurt, gprsCsq: $gprsCsq, illu: $illu, powerFactor: $powerFactor, temp: $temp, energy: $energy, voltage: $voltage, tsMqtt: $tsMqtt, rESETCOUNT: $rESETCOUNT, version: $version, lbsLongitude: $lbsLongitude, lbsLatitude: $lbsLatitude, firDimming: $firDimming, dimmingLock: $dimmingLock, secDimming: $secDimming, dimming: $dimming, angleCalibrate: $angleCalibrate, warningState: $warningState, senserFault: $senserFault, alarmLightMode: $alarmLightMode, sUBID1: $sUBID1, longitude: $longitude, latitude: $latitude, secTpFir: $secTpFir, thirTpFir: $thirTpFir, firTtFir: $firTtFir, secTtFir: $secTtFir, fifTpFir: $fifTpFir, firTpFir: $firTpFir, fifTtFir: $fifTtFir, fourTpFir: $fourTpFir, fourTtFir: $fourTtFir, sixTtFir: $sixTtFir, thirTtFir: $thirTtFir, sixTpFir: $sixTpFir, secTtSec: $secTtSec, fourTpSec: $fourTpSec, thirTpSec: $thirTpSec, fourTtSec: $fourTtSec, thirTtSec: $thirTtSec, firTtSec: $firTtSec, sixTtSec: $sixTtSec, firTpSec: $firTpSec, sixTpSec: $sixTpSec, fifTtSec: $fifTtSec, fifTpSec: $fifTpSec, secTpSec: $secTpSec, vDownthreshold: $vDownthreshold, cDownthreshold: $cDownthreshold, cUpthreshold: $cUpthreshold, vUpthreshold: $vUpthreshold, leakCThreshold: $leakCThreshold, leakCEnable: $leakCEnable, overCurrentEnable: $overCurrentEnable, illuLightEnable: $illuLightEnable, degWarningEnable: $degWarningEnable, alarmEnable: $alarmEnable, msg: $msg, time: $time, voc: $voc, pm25: $pm25, hum: $hum, iRDimmingEn: $iRDimmingEn}';
  }
}