void main(List<String> args) {
  PayBase wx = WxPay();
  wx.pay();
  PayBase ali = AliPay();
  ali.pay();
}

// 基础支付类
class PayBase {
  void pay() {
    print("基础支付");
  }
}

// 微信支付类
class WxPay extends PayBase {
  @override
  void pay() {
    // TODO: implement pay
    // super.pay();
    print("微信支付");
  }
}

// 支付宝支付类
class AliPay extends PayBase {
  @override
  void pay() {
    // TODO: implement pay
    // super.pay();
    print("支付宝支付");
  }
}
