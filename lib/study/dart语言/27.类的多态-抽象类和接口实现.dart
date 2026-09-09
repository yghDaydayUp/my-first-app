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
