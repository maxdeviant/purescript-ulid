const ulid = require('ulid');

exports.ulidImpl = function () {
  return ulid.ulid();
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
