const ulid = require('ulid');

exports.ulidImpl = function () {
  return ulid.ulid();
};

exports.seededUlidImpl = function (seed) {
  return ulid.ulid(seed);
};

exports.parseUlidImpl = function (input) {
  try {
    // We use `decodeTime` as a means to validate the ULID. If it doesn't throw
    // then we assume that the ULID is valid.
    ulid.decodeTime(input);
    return input;
  } catch (err) {
    return null;
  }
};

exports.monotonicFactoryImpl = function () {
  const factory = ulid.monotonicFactory();

  return function (timestamp) {
    return function () {
      return factory(timestamp);
    };
  };
};
