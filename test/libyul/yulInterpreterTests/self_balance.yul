{
  mstore(0, balance(address()))
  mstore(0x20, selfbalance())
  mstore(0x40, balance(div(mul(address(), 2), 2)))
  mstore(0x60, balance(add(address(), 1)))
}
// ====
// EVMVersion: >=istanbul
// ----
// Trace:
// Memory dump:
//      0: 0000000000000000000000000000000000000000000000000000000022223333
//     20: 0000000000000000000000000000000000000000000000000000000022223333
//     40: 0000000000000000000000000000000000000000000000000000000022223333
//     60: 0000000000000000000000000000000000000000000000000000000022222222
// Storage dump: