/// closed to changes
///
///

class PriceCalculator {
  double calculate(double price, double discount) {
    return price - price * discount;
  }

  void printPrice(double x) {
    print(x);
  }
}

class GuestCalculator extends PriceCalculator {
  @override
  double calculate(double price, double discount) {
    return price - (price * discount / 2);
  }
}

class VipCalculator extends PriceCalculator {
  @override
  double calculate(double price, double discount) {
    return price - (price * discount * 2);
  }
}

void main() {
  PriceCalculator calculator = PriceCalculator();
  final value = calculator.calculate(100, 0.2);
  calculator.printPrice(value);

  calculator = GuestCalculator();
  final value2 = calculator.calculate(100, 0.2);
  calculator.printPrice(value2);
}

class TariffStrategyFactory {
  static Tariff getTariff(Tariff tariff, User user) {
    return switch (tariff) {
      XlTariff() => XlTariff(user),
      XsTariff() => XsTariff(user),
      LsTariff() => LsTariff(user),
      MSTariff() => MSTariff(user),
    };
  }
}

sealed class Tariff {
  const Tariff();

  double calculate();
}

class XlTariff extends Tariff {
  const XlTariff(this.user);

  final User user;

  @override
  double calculate() => switch (user) {
        NoPaidUser() => 100,
        PaidUser() => 120,
      };
}

class XsTariff extends Tariff {
  const XsTariff(this.user);

  final User user;

  @override
  double calculate() => switch (user) {
        NoPaidUser() => 50,
        PaidUser() => 70,
      };
}

class LsTariff extends Tariff {
  const LsTariff(this.user);

  final User user;

  @override
  double calculate() => switch (user) {
        NoPaidUser() => 200,
        PaidUser() => 250,
      };
}

class MSTariff extends Tariff {
  const MSTariff(this.user);

  final User user;

  @override
  double calculate() => switch (user) {
        NoPaidUser() => 250,
        PaidUser() => 300,
      };
}

sealed class User {}

class NoPaidUser extends User {}

class PaidUser extends User {}
