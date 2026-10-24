
/**
 Dart中类的多态-继承和方法重写
  ● 定义：Dart中的类的是指同一操作作用于不同的对象，可以产生不同的执行效果
  ●场景：微信和支付宝都遵循同样支付接口，但实现逻辑不同，即同一个支付操作拥有不同的支付效果
  ●实现方式：1.继承和方法重写 、2. 抽象类和接口
  ●需求：定义一个父类，分别实现微信和支付宝支付类，重写得到不同的支付逻辑
 */
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
