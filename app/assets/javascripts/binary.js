"use strict";

var _prototypeProperties = function (child, staticProps, instanceProps) { if (staticProps) Object.defineProperties(child, staticProps); if (instanceProps) Object.defineProperties(child.prototype, instanceProps); };

var _classCallCheck = function (instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } };

var ALPHABET = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];

var BINARY = {
  // [16, 8, 4, 2, 1]
  "": [0, 0, 0, 0, 0], // 0
  A: [0, 0, 0, 0, 1], // 1
  B: [0, 0, 0, 1, 0], // 2
  C: [0, 0, 0, 1, 1], // 3
  D: [0, 0, 1, 0, 0], // 4
  E: [0, 0, 1, 0, 1], // 5
  F: [0, 0, 1, 1, 0], // 6
  G: [0, 0, 1, 1, 1], // 7
  H: [0, 1, 0, 0, 0], // 8
  I: [0, 1, 0, 0, 1], // 9
  J: [0, 1, 0, 1, 0], // 10
  K: [0, 1, 0, 1, 1], // 11
  L: [0, 1, 1, 0, 0], // 12
  M: [0, 1, 1, 0, 1], // 13
  N: [0, 1, 1, 1, 0], // 14
  O: [0, 1, 1, 1, 1], // 15
  P: [1, 0, 0, 0, 0], // 16
  Q: [1, 0, 0, 0, 1], // 17
  R: [1, 0, 0, 1, 0], // 18
  S: [1, 0, 0, 1, 1], // 19
  T: [1, 0, 1, 0, 0], // 20
  U: [1, 0, 1, 0, 1], // 21
  V: [1, 0, 1, 1, 0], // 22
  W: [1, 0, 1, 1, 1], // 23
  X: [1, 1, 0, 0, 0], // 24
  Y: [1, 1, 0, 0, 1], // 25
  Z: [1, 1, 0, 1, 0] // 26
};

var BinaryCalculator = (function () {
  function BinaryCalculator() {
    _classCallCheck(this, BinaryCalculator);
  }

  _prototypeProperties(BinaryCalculator, null, {
    calculateFromLetter: {
      value: function calculateFromLetter(letter) {
        return {
          position: this.letterToPosition(letter),
          binary: this.letterToBinary(letter)
        };
      },
      writable: true,
      configurable: true
    },
    calculateFromPosition: {
      value: function calculateFromPosition(position) {
        return {
          letter: this.positionToLetter(position),
          binary: this.positionToBinary(position)
        };
      },
      writable: true,
      configurable: true
    },
    calculateFromBinary: {
      value: function calculateFromBinary(binary) {
        return {
          letter: this.binaryToLetter(binary),
          position: this.binaryToPosition(binary)
        };
      },
      writable: true,
      configurable: true
    },
    letterToPosition: {
      value: function letterToPosition(letter) {
        var index = ALPHABET.indexOf(letter);

        if (index === -1) {
          return "";
        }return index + 1;
      },
      writable: true,
      configurable: true
    },
    letterToBinary: {
      value: function letterToBinary(letter) {
        return BINARY[letter] || "";
      },
      writable: true,
      configurable: true
    },
    positionToBinary: {
      value: function positionToBinary(position) {
        var letter = this.positionToLetter(position);
        return this.letterToBinary(letter);
      },
      writable: true,
      configurable: true
    },
    positionToLetter: {
      value: function positionToLetter(position) {
        return ALPHABET[position - 1] || "";
      },
      writable: true,
      configurable: true
    },
    binaryToPosition: {
      value: function binaryToPosition(binary) {
        var letter = this.binaryToLetter(binary);
        return this.letterToPosition(letter);
      },
      writable: true,
      configurable: true
    },
    binaryToLetter: {
      value: function binaryToLetter(binary) {
        var letter = undefined;

        for (var _letter in BINARY) {
          if (BINARY[_letter].join("") === binary.join("")) {
            letter = _letter;
          }
        }

        return letter || "";
      },
      writable: true,
      configurable: true
    }
  });

  return BinaryCalculator;
})();"use strict";

var _prototypeProperties = function (child, staticProps, instanceProps) { if (staticProps) Object.defineProperties(child, staticProps); if (instanceProps) Object.defineProperties(child.prototype, instanceProps); };

var _classCallCheck = function (instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } };

var ColumnRenderer = (function () {
  function ColumnRenderer(input, letterPosition, holes) {
    _classCallCheck(this, ColumnRenderer);

    this.input = input;
    this.letterPosition = letterPosition;
    this.holes = holes;

    this.calculator = new BinaryCalculator();
  }

  _prototypeProperties(ColumnRenderer, null, {
    letterChanged: {
      value: function letterChanged(letter) {
        var result = this.calculator.calculateFromLetter(letter.toUpperCase());
        this.updateHoles(result.binary);
        this.updatePosition(result.position);
      },
      writable: true,
      configurable: true
    },
    positionChanged: {
      value: function positionChanged(position) {
        var result = this.calculator.calculateFromLetter(position);
        this.updateHoles(result.binary);
        this.updateLetter(result.letter);
      },
      writable: true,
      configurable: true
    },
    holesChanged: {
      value: function holesChanged(holes) {
        var binary = this.getBinaryFromHoles(holes);
        var result = this.calculator.calculateFromBinary(binary);
        this.updateLetter(result.letter);
        this.updatePosition(result.position);
      },
      writable: true,
      configurable: true
    },
    updateLetter: {
      value: function updateLetter(letter) {
        this.input.value = letter;
      },
      writable: true,
      configurable: true
    },
    updatePosition: {
      value: function updatePosition(position) {
        this.letterPosition.innerHTML = position;
      },
      writable: true,
      configurable: true
    },
    updateHoles: {
      value: function updateHoles(binary) {
        var _this = this;
        binary.forEach(function (on, i) {
          var $hole = $(_this.holes[i]);
          $hole.removeClass("on");
          if (on) $hole.addClass("on");
        });
      },
      writable: true,
      configurable: true
    },
    getBinaryFromHoles: {
      value: function getBinaryFromHoles(holes) {
        var binary = [];

        holes.forEach(function (holeEl) {
          binary.push($(holeEl).hasClass("on") ? 1 : 0);
        });

        return binary;
      },
      writable: true,
      configurable: true
    }
  });

  return ColumnRenderer;
})();"use strict";

var _prototypeProperties = function (child, staticProps, instanceProps) { if (staticProps) Object.defineProperties(child, staticProps); if (instanceProps) Object.defineProperties(child.prototype, instanceProps); };

var _classCallCheck = function (instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } };

/**
 * SWE Binary Reader!
 */
var BinaryReader = (function () {
  function BinaryReader(table) {
    _classCallCheck(this, BinaryReader);

    this.table = table;
  }

  _prototypeProperties(BinaryReader, null, {
    init: {
      value: function init() {
        this.collectHoles();
        this.collectInputs();
        this.collectLetterPositions();

        this.renderers = [];

        for (var i = 0; i < 8; i++) {
          this.renderers.push(new ColumnRenderer(this.inputs[i], this.letterPositions[i], this.holes[i]));
        }

        this.assignListeners();
      },
      writable: true,
      configurable: true
    },
    collectHoles: {
      value: function collectHoles() {
        this.holes = [];

        for (var i = 0; i < 8; i++) {
          this.holes.push([]);

          for (var j = 0; j < 5; j++) {
            var selector = "td[data-letter=\"" + i + "\"][data-hole=\"" + j + "\"]";
            var element = document.querySelector(selector);

            this.holes[i].push(element);
          }
        }
      },
      writable: true,
      configurable: true
    },
    collectInputs: {
      value: function collectInputs() {
        this.inputs = [];

        for (var i = 0; i < 8; i++) {
          var selector = "input[name=\"letter-" + i + "\"]";
          this.inputs[i] = document.querySelector(selector);
        }
      },
      writable: true,
      configurable: true
    },
    collectLetterPositions: {
      value: function collectLetterPositions() {
        this.letterPositions = [];

        for (var i = 0; i < 8; i++) {
          var selector = "span#letter-position-" + i;
          this.letterPositions[i] = document.querySelector(selector);
        }
      },
      writable: true,
      configurable: true
    },
    assignListeners: {
      value: function assignListeners() {
        this.assignInputListeners();
        this.assignPositionListeners();
        this.assignHoleListeners();
      },
      writable: true,
      configurable: true
    },
    assignInputListeners: {
      value: function assignInputListeners() {
        var _this = this;
        this.inputs.forEach(function (input, i) {
          $(input).keyup(function (e) {
            _this.renderers[i].letterChanged(e.target.value);
          });
        });
      },
      writable: true,
      configurable: true
    },
    assignPositionListeners: {
      value: function assignPositionListeners() {
        var _this = this;
        this.letterPositions.forEach(function (position, i) {
          $(position).keyup(function (e) {
            _this.renderers[i].positionChanged(e.target.value);
          });
        });
      },
      writable: true,
      configurable: true
    },
    assignHoleListeners: {
      value: function assignHoleListeners() {
        var _this = this;
        this.holes.forEach(function (holes, i) {
          holes.forEach(function (hole, j) {
            $(hole).click(function (e) {
              _this.holeClicked(_this.holes[i][j]);
              _this.renderers[i].holesChanged(_this.holes[i]);
            });
          });
        });
      },
      writable: true,
      configurable: true
    },
    holeClicked: {
      value: function holeClicked(hole) {
        var number = Math.floor(Math.random() * 8) + 1;

        if ($(hole).hasClass("on")) {
          $(hole).removeClass("on-1");
          $(hole).removeClass("on-2");
          $(hole).removeClass("on-3");
          $(hole).removeClass("on-4");
          $(hole).removeClass("on-5");
          $(hole).removeClass("on-6");
          $(hole).removeClass("on-7");
        } else {
          $(hole).addClass("on-" + number);
        }

        $(hole).toggleClass("on");
      },
      writable: true,
      configurable: true
    }
  });

  return BinaryReader;
})();"use strict";

var table = document.querySelector("#binary-reader-table");
var reader = new BinaryReader(table);

reader.init();