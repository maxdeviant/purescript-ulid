const ulid = require('ulid');

exports.ulidImpl = function () {
  return ulid.ulid();
};
