// DO NOT EDIT.
// swift-format-ignore-file
// swiftlint:disable all
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: order.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

enum Order_PaymentMethod: SwiftProtobuf.Enum, Swift.CaseIterable {
  typealias RawValue = Int
  case cash // = 0
  case iomoney // = 1
  case UNRECOGNIZED(Int)

  init() {
    self = .cash
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .cash
    case 1: self = .iomoney
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .cash: return 0
    case .iomoney: return 1
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static let allCases: [Order_PaymentMethod] = [
    .cash,
    .iomoney,
  ]

}

enum Order_OrderStatus: SwiftProtobuf.Enum, Swift.CaseIterable {
  typealias RawValue = Int

  /// В ожидании
  case pending // = 0

  /// Отправлен
  case shipped // = 1

  /// Доставлен
  case delivered // = 2

  /// Отменён
  case cancelled // = 3
  case UNRECOGNIZED(Int)

  init() {
    self = .pending
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .pending
    case 1: self = .shipped
    case 2: self = .delivered
    case 3: self = .cancelled
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .pending: return 0
    case .shipped: return 1
    case .delivered: return 2
    case .cancelled: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static let allCases: [Order_OrderStatus] = [
    .pending,
    .shipped,
    .delivered,
    .cancelled,
  ]

}

/// ################# MakeOrder ################# 
struct Order_MakeOrderReq: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var totalPrice: Double = 0

  var deliveryAddressID: String = String()

  var mass: Double = 0

  var paymentMethod: Order_PaymentMethod = .cash

  var deliveryDate: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _deliveryDate ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_deliveryDate = newValue}
  }
  /// Returns true if `deliveryDate` has been explicitly set.
  var hasDeliveryDate: Bool {return self._deliveryDate != nil}
  /// Clears the value of `deliveryDate`. Subsequent reads from it will return its default value.
  mutating func clearDeliveryDate() {self._deliveryDate = nil}

  var fillingID: String = String()

  var sellerID: String = String()

  var cakeID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _deliveryDate: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

struct Order_MakeOrderRes: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var orderID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// ################# Orders ################# 
struct Order_OrdersRes: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var orders: [Order_Order] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// ################# UpdateOrderState ################# 
struct Order_UpdateOrderStateReq: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var orderID: String = String()

  var updatedStatus: Order_OrderStatus = .pending

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// ################# GetAllOrders ################# 
struct Order_GetAllOrdersRes: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var orders: [Order_Order] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// ################# GetAllOrders ################# 
struct Order_OrderByIDReq: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var orderID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Order_OrderByIDRes: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var order: Order_Order {
    get {return _order ?? Order_Order()}
    set {_order = newValue}
  }
  /// Returns true if `order` has been explicitly set.
  var hasOrder: Bool {return self._order != nil}
  /// Clears the value of `order`. Subsequent reads from it will return its default value.
  mutating func clearOrder() {self._order = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _order: Order_Order? = nil
}

struct Order_Order: @unchecked Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String {
    get {return _storage._id}
    set {_uniqueStorage()._id = newValue}
  }

  var totalPrice: Double {
    get {return _storage._totalPrice}
    set {_uniqueStorage()._totalPrice = newValue}
  }

  var deliveryAddress: Profile_Address {
    get {return _storage._deliveryAddress ?? Profile_Address()}
    set {_uniqueStorage()._deliveryAddress = newValue}
  }
  /// Returns true if `deliveryAddress` has been explicitly set.
  var hasDeliveryAddress: Bool {return _storage._deliveryAddress != nil}
  /// Clears the value of `deliveryAddress`. Subsequent reads from it will return its default value.
  mutating func clearDeliveryAddress() {_uniqueStorage()._deliveryAddress = nil}

  var mass: Double {
    get {return _storage._mass}
    set {_uniqueStorage()._mass = newValue}
  }

  var filling: Cake_Filling {
    get {return _storage._filling ?? Cake_Filling()}
    set {_uniqueStorage()._filling = newValue}
  }
  /// Returns true if `filling` has been explicitly set.
  var hasFilling: Bool {return _storage._filling != nil}
  /// Clears the value of `filling`. Subsequent reads from it will return its default value.
  mutating func clearFilling() {_uniqueStorage()._filling = nil}

  var deliveryDate: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _storage._deliveryDate ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_uniqueStorage()._deliveryDate = newValue}
  }
  /// Returns true if `deliveryDate` has been explicitly set.
  var hasDeliveryDate: Bool {return _storage._deliveryDate != nil}
  /// Clears the value of `deliveryDate`. Subsequent reads from it will return its default value.
  mutating func clearDeliveryDate() {_uniqueStorage()._deliveryDate = nil}

  var sellerID: String {
    get {return _storage._sellerID}
    set {_uniqueStorage()._sellerID = newValue}
  }

  var cakeID: String {
    get {return _storage._cakeID}
    set {_uniqueStorage()._cakeID = newValue}
  }

  var paymentMethod: Order_PaymentMethod {
    get {return _storage._paymentMethod}
    set {_uniqueStorage()._paymentMethod = newValue}
  }

  var status: Order_OrderStatus {
    get {return _storage._status}
    set {_uniqueStorage()._status = newValue}
  }

  var createdAt: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _storage._createdAt ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_uniqueStorage()._createdAt = newValue}
  }
  /// Returns true if `createdAt` has been explicitly set.
  var hasCreatedAt: Bool {return _storage._createdAt != nil}
  /// Clears the value of `createdAt`. Subsequent reads from it will return its default value.
  mutating func clearCreatedAt() {_uniqueStorage()._createdAt = nil}

  var updatedAt: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _storage._updatedAt ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_uniqueStorage()._updatedAt = newValue}
  }
  /// Returns true if `updatedAt` has been explicitly set.
  var hasUpdatedAt: Bool {return _storage._updatedAt != nil}
  /// Clears the value of `updatedAt`. Subsequent reads from it will return its default value.
  mutating func clearUpdatedAt() {_uniqueStorage()._updatedAt = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "order"

extension Order_PaymentMethod: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "CASH"),
    1: .same(proto: "IOMoney"),
  ]
}

extension Order_OrderStatus: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "PENDING"),
    1: .same(proto: "SHIPPED"),
    2: .same(proto: "DELIVERED"),
    3: .same(proto: "CANCELLED"),
  ]
}

extension Order_MakeOrderReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MakeOrderReq"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "totalPrice"),
    2: .same(proto: "deliveryAddressID"),
    3: .same(proto: "mass"),
    4: .same(proto: "paymentMethod"),
    5: .same(proto: "deliveryDate"),
    6: .same(proto: "fillingID"),
    7: .same(proto: "sellerID"),
    8: .same(proto: "cakeID"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularDoubleField(value: &self.totalPrice) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.deliveryAddressID) }()
      case 3: try { try decoder.decodeSingularDoubleField(value: &self.mass) }()
      case 4: try { try decoder.decodeSingularEnumField(value: &self.paymentMethod) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._deliveryDate) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.fillingID) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.sellerID) }()
      case 8: try { try decoder.decodeSingularStringField(value: &self.cakeID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.totalPrice.bitPattern != 0 {
      try visitor.visitSingularDoubleField(value: self.totalPrice, fieldNumber: 1)
    }
    if !self.deliveryAddressID.isEmpty {
      try visitor.visitSingularStringField(value: self.deliveryAddressID, fieldNumber: 2)
    }
    if self.mass.bitPattern != 0 {
      try visitor.visitSingularDoubleField(value: self.mass, fieldNumber: 3)
    }
    if self.paymentMethod != .cash {
      try visitor.visitSingularEnumField(value: self.paymentMethod, fieldNumber: 4)
    }
    try { if let v = self._deliveryDate {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    } }()
    if !self.fillingID.isEmpty {
      try visitor.visitSingularStringField(value: self.fillingID, fieldNumber: 6)
    }
    if !self.sellerID.isEmpty {
      try visitor.visitSingularStringField(value: self.sellerID, fieldNumber: 7)
    }
    if !self.cakeID.isEmpty {
      try visitor.visitSingularStringField(value: self.cakeID, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Order_MakeOrderReq, rhs: Order_MakeOrderReq) -> Bool {
    if lhs.totalPrice != rhs.totalPrice {return false}
    if lhs.deliveryAddressID != rhs.deliveryAddressID {return false}
    if lhs.mass != rhs.mass {return false}
    if lhs.paymentMethod != rhs.paymentMethod {return false}
    if lhs._deliveryDate != rhs._deliveryDate {return false}
    if lhs.fillingID != rhs.fillingID {return false}
    if lhs.sellerID != rhs.sellerID {return false}
    if lhs.cakeID != rhs.cakeID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Order_MakeOrderRes: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MakeOrderRes"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "orderID"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.orderID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.orderID.isEmpty {
      try visitor.visitSingularStringField(value: self.orderID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Order_MakeOrderRes, rhs: Order_MakeOrderRes) -> Bool {
    if lhs.orderID != rhs.orderID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Order_OrdersRes: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".OrdersRes"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "orders"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.orders) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.orders.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.orders, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Order_OrdersRes, rhs: Order_OrdersRes) -> Bool {
    if lhs.orders != rhs.orders {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Order_UpdateOrderStateReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UpdateOrderStateReq"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "orderID"),
    2: .same(proto: "updatedStatus"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.orderID) }()
      case 2: try { try decoder.decodeSingularEnumField(value: &self.updatedStatus) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.orderID.isEmpty {
      try visitor.visitSingularStringField(value: self.orderID, fieldNumber: 1)
    }
    if self.updatedStatus != .pending {
      try visitor.visitSingularEnumField(value: self.updatedStatus, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Order_UpdateOrderStateReq, rhs: Order_UpdateOrderStateReq) -> Bool {
    if lhs.orderID != rhs.orderID {return false}
    if lhs.updatedStatus != rhs.updatedStatus {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Order_GetAllOrdersRes: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetAllOrdersRes"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "orders"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.orders) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.orders.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.orders, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Order_GetAllOrdersRes, rhs: Order_GetAllOrdersRes) -> Bool {
    if lhs.orders != rhs.orders {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Order_OrderByIDReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".OrderByIDReq"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "orderID"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.orderID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.orderID.isEmpty {
      try visitor.visitSingularStringField(value: self.orderID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Order_OrderByIDReq, rhs: Order_OrderByIDReq) -> Bool {
    if lhs.orderID != rhs.orderID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Order_OrderByIDRes: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".OrderByIDRes"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "order"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._order) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._order {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Order_OrderByIDRes, rhs: Order_OrderByIDRes) -> Bool {
    if lhs._order != rhs._order {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Order_Order: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Order"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "totalPrice"),
    3: .same(proto: "deliveryAddress"),
    4: .same(proto: "mass"),
    5: .same(proto: "filling"),
    6: .same(proto: "deliveryDate"),
    8: .same(proto: "sellerID"),
    9: .same(proto: "cakeID"),
    10: .same(proto: "paymentMethod"),
    11: .same(proto: "status"),
    12: .same(proto: "createdAt"),
    13: .same(proto: "updatedAt"),
  ]

  fileprivate class _StorageClass {
    var _id: String = String()
    var _totalPrice: Double = 0
    var _deliveryAddress: Profile_Address? = nil
    var _mass: Double = 0
    var _filling: Cake_Filling? = nil
    var _deliveryDate: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
    var _sellerID: String = String()
    var _cakeID: String = String()
    var _paymentMethod: Order_PaymentMethod = .cash
    var _status: Order_OrderStatus = .pending
    var _createdAt: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
    var _updatedAt: SwiftProtobuf.Google_Protobuf_Timestamp? = nil

    #if swift(>=5.10)
      // This property is used as the initial default value for new instances of the type.
      // The type itself is protecting the reference to its storage via CoW semantics.
      // This will force a copy to be made of this reference when the first mutation occurs;
      // hence, it is safe to mark this as `nonisolated(unsafe)`.
      static nonisolated(unsafe) let defaultInstance = _StorageClass()
    #else
      static let defaultInstance = _StorageClass()
    #endif

    private init() {}

    init(copying source: _StorageClass) {
      _id = source._id
      _totalPrice = source._totalPrice
      _deliveryAddress = source._deliveryAddress
      _mass = source._mass
      _filling = source._filling
      _deliveryDate = source._deliveryDate
      _sellerID = source._sellerID
      _cakeID = source._cakeID
      _paymentMethod = source._paymentMethod
      _status = source._status
      _createdAt = source._createdAt
      _updatedAt = source._updatedAt
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every case branch when no optimizations are
        // enabled. https://github.com/apple/swift-protobuf/issues/1034
        switch fieldNumber {
        case 1: try { try decoder.decodeSingularStringField(value: &_storage._id) }()
        case 2: try { try decoder.decodeSingularDoubleField(value: &_storage._totalPrice) }()
        case 3: try { try decoder.decodeSingularMessageField(value: &_storage._deliveryAddress) }()
        case 4: try { try decoder.decodeSingularDoubleField(value: &_storage._mass) }()
        case 5: try { try decoder.decodeSingularMessageField(value: &_storage._filling) }()
        case 6: try { try decoder.decodeSingularMessageField(value: &_storage._deliveryDate) }()
        case 8: try { try decoder.decodeSingularStringField(value: &_storage._sellerID) }()
        case 9: try { try decoder.decodeSingularStringField(value: &_storage._cakeID) }()
        case 10: try { try decoder.decodeSingularEnumField(value: &_storage._paymentMethod) }()
        case 11: try { try decoder.decodeSingularEnumField(value: &_storage._status) }()
        case 12: try { try decoder.decodeSingularMessageField(value: &_storage._createdAt) }()
        case 13: try { try decoder.decodeSingularMessageField(value: &_storage._updatedAt) }()
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every if/case branch local when no optimizations
      // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
      // https://github.com/apple/swift-protobuf/issues/1182
      if !_storage._id.isEmpty {
        try visitor.visitSingularStringField(value: _storage._id, fieldNumber: 1)
      }
      if _storage._totalPrice.bitPattern != 0 {
        try visitor.visitSingularDoubleField(value: _storage._totalPrice, fieldNumber: 2)
      }
      try { if let v = _storage._deliveryAddress {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      } }()
      if _storage._mass.bitPattern != 0 {
        try visitor.visitSingularDoubleField(value: _storage._mass, fieldNumber: 4)
      }
      try { if let v = _storage._filling {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      } }()
      try { if let v = _storage._deliveryDate {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      } }()
      if !_storage._sellerID.isEmpty {
        try visitor.visitSingularStringField(value: _storage._sellerID, fieldNumber: 8)
      }
      if !_storage._cakeID.isEmpty {
        try visitor.visitSingularStringField(value: _storage._cakeID, fieldNumber: 9)
      }
      if _storage._paymentMethod != .cash {
        try visitor.visitSingularEnumField(value: _storage._paymentMethod, fieldNumber: 10)
      }
      if _storage._status != .pending {
        try visitor.visitSingularEnumField(value: _storage._status, fieldNumber: 11)
      }
      try { if let v = _storage._createdAt {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 12)
      } }()
      try { if let v = _storage._updatedAt {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 13)
      } }()
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Order_Order, rhs: Order_Order) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._id != rhs_storage._id {return false}
        if _storage._totalPrice != rhs_storage._totalPrice {return false}
        if _storage._deliveryAddress != rhs_storage._deliveryAddress {return false}
        if _storage._mass != rhs_storage._mass {return false}
        if _storage._filling != rhs_storage._filling {return false}
        if _storage._deliveryDate != rhs_storage._deliveryDate {return false}
        if _storage._sellerID != rhs_storage._sellerID {return false}
        if _storage._cakeID != rhs_storage._cakeID {return false}
        if _storage._paymentMethod != rhs_storage._paymentMethod {return false}
        if _storage._status != rhs_storage._status {return false}
        if _storage._createdAt != rhs_storage._createdAt {return false}
        if _storage._updatedAt != rhs_storage._updatedAt {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
