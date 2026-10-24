
/** Dart中的空安全机制
    ● 定义：在Dart语言中，通过编译静态检查将运行时空指针提前暴露
    ● 特点：将空指针异常从运行时提前至编译时，减少线上崩溃
    ●常用空安全操作符
 */

void main(List<String> args){
  //可空类型
  String ?username = null; // 声明可空变量 String?→ 允许 String或 null
  username?.length;//安全访问  对象为 null时跳过操作，返回 null. user?.name→ 若 user为 null则返回 null
  username!.length;//非空断言  开发者保证变量非空（否则运行时崩溃） name!.length→ 断言 name非空
  username?? "老杨";//空合并   左侧为 null时返回右侧默认值   name ?? "Guest"→ name为 null时返回"Guest"
 
}