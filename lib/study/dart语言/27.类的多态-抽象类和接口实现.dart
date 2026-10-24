
/**
  Dart中类的多态-抽象类和接口实现
  ●方式：使用abstract关键字声明一个抽象类(没有实现体)
  ●方式：使用implements关键字继承并实现抽象类
 */
void main(List<String> args) {
  PayBase wx = WxPay();
  PayBase ali = AliPay();
  wx.pay();
  ali.pay();
}

abstract class PayBase {
  void pay(); // 抽象类是不写具体实现的
}

// 微信支付
class WxPay implements PayBase {
  @override
  void pay() {
    // TODO: implement pay
    print("微信支付");
  }
}

// 支付宝支付
class AliPay implements PayBase {
  @override
  void pay() {
    // TODO: implement pay
    print("支付宝支付");
  }
}
