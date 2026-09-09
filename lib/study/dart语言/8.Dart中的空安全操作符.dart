
void main(List<String> args){
  //可空类型
  String ?username = null;
  username?.length;//安全访问
  username!.length;//非空断言
  username?? "老杨";//空合并

}