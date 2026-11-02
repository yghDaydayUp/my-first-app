class UserInfo{
  String account;
  String avatar;
  String birthday;
  String cityCode;
  String gender;
  String id;
  String mobile;
  String nickname;
  String profession;
  String provinceCode;
  String token;

   UserInfo({
    required this.account,
    required this.avatar,
    required this.birthday,
    required this.cityCode,
    required this.gender,
    required this.id,
    required this.mobile,
    required this.nickname,
    required this.profession,
    required this.provinceCode,
    required this.token,
  });

   factory UserInfo.fromJSON(Map<String, dynamic> json) => UserInfo(
    account: json["account"] ?? "",
    avatar: json["avatar"] ?? "",
    birthday: json["birthday"] ?? "",
    cityCode: json["cityCode"] ?? "",
    gender: json["gender"] ?? "",
    id: json["id"] ?? "",
    mobile: json["mobile"] ?? "",
    nickname: json["nickname"] ?? "",
    profession: json["profession"] ?? "",
    provinceCode: json["provinceCode"] ?? "",
    token: json["token"] ?? "",
  );
}

/**
 1. 代码提示：写 `user.` 的时候编辑器自动弹出所有字段，不容易写错 key（直接写 json 容易拼错字符串 key）
 2. 空安全兼容：`?? ""`兜底 null，不会因为后端少返回字段直接崩溃
 3. 集中管理用户所有信息，登录成功之后全局保存这个对象
 */