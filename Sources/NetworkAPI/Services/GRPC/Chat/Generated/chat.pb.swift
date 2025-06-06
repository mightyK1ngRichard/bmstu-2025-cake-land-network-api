// DO NOT EDIT.
// swift-format-ignore-file
// swiftlint:disable all
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: chat.proto
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

/// ################# UserChatsResponse ################# 
struct Chat_UserChatsResponse: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var users: [Cake_User] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// ################# ChatHistory ################# 
struct Chat_ChatHistoryRequest: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var interlocutorID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Chat_ChatHistoryResponse: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var messages: [Chat_ChatMessage] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Chat_ChatMessage: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Код сообщения
  var id: String = String()

  /// Код собеседника
  var interlocutorID: String = String()

  /// Отправитель сообщения
  var senderID: String = String()

  /// Текст сообщения
  var text: String = String()

  /// Дата отправки сообщения
  var dateCreation: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _dateCreation ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_dateCreation = newValue}
  }
  /// Returns true if `dateCreation` has been explicitly set.
  var hasDateCreation: Bool {return self._dateCreation != nil}
  /// Clears the value of `dateCreation`. Subsequent reads from it will return its default value.
  mutating func clearDateCreation() {self._dateCreation = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _dateCreation: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "chat"

extension Chat_UserChatsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserChatsResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "users"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.users) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.users.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.users, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Chat_UserChatsResponse, rhs: Chat_UserChatsResponse) -> Bool {
    if lhs.users != rhs.users {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Chat_ChatHistoryRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ChatHistoryRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "interlocutorID"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.interlocutorID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.interlocutorID.isEmpty {
      try visitor.visitSingularStringField(value: self.interlocutorID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Chat_ChatHistoryRequest, rhs: Chat_ChatHistoryRequest) -> Bool {
    if lhs.interlocutorID != rhs.interlocutorID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Chat_ChatHistoryResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ChatHistoryResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "messages"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.messages) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.messages.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.messages, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Chat_ChatHistoryResponse, rhs: Chat_ChatHistoryResponse) -> Bool {
    if lhs.messages != rhs.messages {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Chat_ChatMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ChatMessage"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "interlocutorID"),
    3: .same(proto: "senderID"),
    4: .same(proto: "text"),
    5: .same(proto: "dateCreation"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.interlocutorID) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.senderID) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.text) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._dateCreation) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.interlocutorID.isEmpty {
      try visitor.visitSingularStringField(value: self.interlocutorID, fieldNumber: 2)
    }
    if !self.senderID.isEmpty {
      try visitor.visitSingularStringField(value: self.senderID, fieldNumber: 3)
    }
    if !self.text.isEmpty {
      try visitor.visitSingularStringField(value: self.text, fieldNumber: 4)
    }
    try { if let v = self._dateCreation {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Chat_ChatMessage, rhs: Chat_ChatMessage) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.interlocutorID != rhs.interlocutorID {return false}
    if lhs.senderID != rhs.senderID {return false}
    if lhs.text != rhs.text {return false}
    if lhs._dateCreation != rhs._dateCreation {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
