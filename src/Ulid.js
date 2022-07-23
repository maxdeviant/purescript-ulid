import { decodeTime, monotonicFactory, ulid } from 'ulid';

export const ulidImpl = () => ulid();

export const seededUlidImpl = seed => ulid(seed);

export const parseUlidImpl = input => {
  try {
    // We use `decodeTime` as a means to validate the ULID. If it doesn't throw
    // then we assume that the ULID is valid.
    decodeTime(input);
    return input;
  } catch (err) {
    return null;
  }
};

export const monotonicFactoryImpl = () => {
  const factory = monotonicFactory();

  return timestamp => () => factory(timestamp);
};
