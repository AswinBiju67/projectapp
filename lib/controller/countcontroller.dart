import 'package:flutter/material.dart';

class Metrocontroller with ChangeNotifier {
  int count = 1;
  int ticket = 1;
  int sports = 1;
  int park = 0;
  int park1 = 0;
  int park2 = 0;
  int park3 = 0;
  int park4 = 0;
  int park5 = 0;

  onincrement() {
    if (count < 10) {
      count++;
      notifyListeners();
    }
  }

  ondecrement() {
    if (count > 1) {
      count--;
      notifyListeners();
    }
  }

  onincrementticket() {
    if (ticket < 10) {
      ticket++;
      notifyListeners();
    }
  }

  ondecrementticket() {
    if (ticket > 1) {
      ticket--;
      notifyListeners();
    }
  }

  onincrementsports() {
    if (sports < 10) {
      sports++;
      notifyListeners();
    }
  }

  ondecrementsports() {
    if (sports > 1) {
      sports--;
      notifyListeners();
    }
  }

  onincrementpark() {
    if (park < 10) {
      park++;
      notifyListeners();
    }
  }

  ondecrementpark() {
    if (park > 0) {
      park--;
      notifyListeners();
    }
  }

  onincrementpark1() {
    if (park1 < 10) {
      park1++;
      notifyListeners();
    }
  }

  ondecrementpark1() {
    if (park1 > 0) {
      park1--;
      notifyListeners();
    }
  }

  onincrementpark2() {
    if (park2 < 10) {
      park2++;
      notifyListeners();
    }
  }

  ondecrementpark2() {
    if (park2 > 0) {
      park2--;
      notifyListeners();
    }
  }

  onincrementpark3() {
    if (park3 < 10) {
      park3++;
      notifyListeners();
    }
  }

  ondecrementpark3() {
    if (park3 > 0) {
      park3--;
      notifyListeners();
    }
  }

  onincrementpark4() {
    if (park4 < 10) {
      park4++;
      notifyListeners();
    }
  }

  ondecrementpark4() {
    if (park4 > 0) {
      park4--;
      notifyListeners();
    }
  }

  onincrementpark5() {
    if (park5 < 10) {
      park5++;
      notifyListeners();
    }
  }

  ondecrementpark5() {
    if (park5 > 0) {
      park5--;
      notifyListeners();
    }
  }

  selectde(int index) {
    if (index == 0) {
      ondecrementpark();
    } else if (index == 1) {
      ondecrementpark1();
    } else if (index == 2) {
      ondecrementpark2();
    } else if (index == 3) {
      ondecrementpark3();
    } else if (index == 4) {
      ondecrementpark4();
    } else {
      ondecrementpark5();
    }
  }

  selectincre(int index) {
    if (index == 0) {
      onincrementpark();
    } else if (index == 1) {
      onincrementpark1();
    } else if (index == 2) {
     onincrementpark2();
    } else if (index == 3) {
      onincrementpark3();
    } else if (index == 4) {
     onincrementpark4();
    } else {
      onincrementpark5();
    }
  }
}
