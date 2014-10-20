//
//  ForceFeedback.swift
//  SwiftAdditions
//
//  Created by C.W. Betts on 10/20/14.
//  Copyright (c) 2014 C.W. Betts. All rights reserved.
//

import Foundation
import ForceFeedback

public enum ForceFeedbackError: HRESULT {
	case OK = 0
	case False = 1
	case DownloadSkipped = 3
	case EffectRestarted = 4
	case Truncated = 8
	case TruncatedAndRestarted = 12
	case InvalidParam = -2147483645
	case NoInterface = -2147483644
	case Generic = -2147483640
	case OutOfMemory = -2147483646
	case Unsupported = -2147483647
	case DeviceFull = -2147220991
	case FFERR_MOREDATA = -2147220990
	case NotDownloaded = -2147220989
	case HasEffects = -2147220988
	case IncompleteEffect = -2147220986
	case EffectPlaying = -2147220984
	case Unplugged = -2147220983
	// MARK: Mac OS X-specific
	case FFERR_INVALIDDOWNLOADID = -2147220736
	case FFERR_DEVICEPAUSED = -2147220735
	case FFERR_INTERNAL = -2147220734
	case FFERR_EFFECTTYPEMISMATCH = -2147220733
	case FFERR_UNSUPPORTEDAXIS = -2147220732
	case FFERR_NOTINITIALIZED = -2147220731
	case FFERR_DEVICERELEASED = -2147220729
	case FFERR_EFFECTTYPENOTSUPPORTED = -2147220730
}


public struct ForceFeedbackCommand : RawOptionSetType {
	public typealias RawValue = UInt32
	private var value: RawValue = 0
	public init(_ value: RawValue) { self.value = value }
	public init(rawValue value: RawValue) { self.value = value }
	public init(nilLiteral: ()) { self.value = 0 }
	public static var allZeros: ForceFeedbackCommand { return self(0) }
	public static func fromMask(raw: RawValue) -> ForceFeedbackCommand { return self(raw) }
	public var rawValue: RawValue { return self.value }
	
	public static var Reset: ForceFeedbackCommand { return ForceFeedbackCommand(1 << 0) }
	public static var StopAll: ForceFeedbackCommand { return ForceFeedbackCommand(1 << 1) }
	public static var Pause: ForceFeedbackCommand { return ForceFeedbackCommand(1 << 2) }
	public static var Continue: ForceFeedbackCommand { return ForceFeedbackCommand(1 << 3) }
	public static var SetActuatorsOn: ForceFeedbackCommand { return ForceFeedbackCommand(1 << 4) }
	public static var SetActuatorsOff: ForceFeedbackCommand { return ForceFeedbackCommand(1 << 5) }
}

public struct ForceFeedbackCooperativeLevel : RawOptionSetType {
	public typealias RawValue = UInt32
	private var value: RawValue = 0
	public init(_ value: RawValue) { self.value = value }
	public init(rawValue value: RawValue) { self.value = value }
	public init(nilLiteral: ()) { self.value = 0 }
	public static var allZeros: ForceFeedbackCooperativeLevel { return self(0) }
	public static func fromMask(raw: RawValue) -> ForceFeedbackCooperativeLevel { return self(raw) }
	public var rawValue: RawValue { return self.value }
	
	public static var Exclusive: ForceFeedbackCooperativeLevel { return ForceFeedbackCooperativeLevel(1 << 0) }
	public static var NonExclusive: ForceFeedbackCooperativeLevel { return ForceFeedbackCooperativeLevel(1 << 1) }
	public static var Foreground: ForceFeedbackCooperativeLevel { return ForceFeedbackCooperativeLevel(1 << 2) }
	public static var Background: ForceFeedbackCooperativeLevel { return ForceFeedbackCooperativeLevel(1 << 3) }
}

public struct ForceFeedbackCapabilitiesEffectType : RawOptionSetType {
	public typealias RawValue = UInt32
	private var value: RawValue = 0
	public init(_ value: RawValue) { self.value = value }
	public init(rawValue value: RawValue) { self.value = value }
	public init(nilLiteral: ()) { self.value = 0 }
	public static var allZeros: ForceFeedbackCapabilitiesEffectType { return self(0) }
	public static func fromMask(raw: RawValue) -> ForceFeedbackCapabilitiesEffectType { return self(raw) }
	public var rawValue: RawValue { return self.value }
	
	public static var ConstantForce: ForceFeedbackCapabilitiesEffectType { return ForceFeedbackCapabilitiesEffectType(1 << 0) }
	public static var RampForce: ForceFeedbackCapabilitiesEffectType { return ForceFeedbackCapabilitiesEffectType(1 << 1) }
	public static var Square: ForceFeedbackCapabilitiesEffectType { return ForceFeedbackCapabilitiesEffectType(1 << 2) }
	public static var Sine: ForceFeedbackCapabilitiesEffectType { return ForceFeedbackCapabilitiesEffectType(1 << 3) }
	public static var Triangle: ForceFeedbackCapabilitiesEffectType { return ForceFeedbackCapabilitiesEffectType(1 << 4) }
	public static var SawtoothUp: ForceFeedbackCapabilitiesEffectType { return ForceFeedbackCapabilitiesEffectType(1 << 5) }
	public static var SawtoothDown: ForceFeedbackCapabilitiesEffectType { return ForceFeedbackCapabilitiesEffectType(1 << 6) }
	public static var Spring: ForceFeedbackCapabilitiesEffectType { return ForceFeedbackCapabilitiesEffectType(1 << 7) }
	public static var Damper: ForceFeedbackCapabilitiesEffectType { return ForceFeedbackCapabilitiesEffectType(1 << 8) }
	public static var Inertia: ForceFeedbackCapabilitiesEffectType { return ForceFeedbackCapabilitiesEffectType(1 << 9) }
	public static var Friction: ForceFeedbackCapabilitiesEffectType { return ForceFeedbackCapabilitiesEffectType(1 << 10) }
	public static var CustomForce: ForceFeedbackCapabilitiesEffectType { return ForceFeedbackCapabilitiesEffectType(1 << 11) }
}

public struct ForceFeedbackCapabilitiesEffectSubType : RawOptionSetType {
	public typealias RawValue = UInt32
	private var value: RawValue = 0
	public init(_ value: RawValue) { self.value = value }
	public init(rawValue value: RawValue) { self.value = value }
	public init(nilLiteral: ()) { self.value = 0 }
	public static var allZeros: ForceFeedbackCapabilitiesEffectSubType { return self(0) }
	public static func fromMask(raw: RawValue) -> ForceFeedbackCapabilitiesEffectSubType { return self(raw) }
	public var rawValue: RawValue { return self.value }
	
	public static var Kinesthetic: ForceFeedbackCapabilitiesEffectSubType { return ForceFeedbackCapabilitiesEffectSubType(1 << 0) }
	public static var Vibration: ForceFeedbackCapabilitiesEffectSubType { return ForceFeedbackCapabilitiesEffectSubType(1 << 1) }
}


public struct ForceFeedbackCoordinateSystem : RawOptionSetType {
	public typealias RawValue = UInt32
	private var value: RawValue = 0
	public init(_ value: RawValue) { self.value = value }
	public init(rawValue value: RawValue) { self.value = value }
	public init(nilLiteral: ()) { self.value = 0 }
	public static var allZeros: ForceFeedbackCoordinateSystem { return self(0) }
	public static func fromMask(raw: RawValue) -> ForceFeedbackCoordinateSystem { return self(raw) }
	public var rawValue: RawValue { return self.value }
	
	public static var Cartesian: ForceFeedbackCoordinateSystem { return ForceFeedbackCoordinateSystem(0x10) }
	public static var Polar: ForceFeedbackCoordinateSystem { return ForceFeedbackCoordinateSystem(0x20) }
	public static var Spherical: ForceFeedbackCoordinateSystem { return ForceFeedbackCoordinateSystem(0x40) }
}


public struct ForceFeedbackEffectParameter : RawOptionSetType {
	public typealias RawValue = UInt32
	private var value: RawValue = 0
	public init(_ value: RawValue) { self.value = value }
	public init(rawValue value: RawValue) { self.value = value }
	public init(nilLiteral: ()) { self.value = 0 }
	public static var allZeros: ForceFeedbackEffectParameter { return self(0) }
	public static func fromMask(raw: RawValue) -> ForceFeedbackEffectParameter { return self(raw) }
	public var rawValue: RawValue { return self.value }
	
	public static var Duration: ForceFeedbackEffectParameter { return ForceFeedbackEffectParameter(1 << 0) }
	public static var SamplePeriod: ForceFeedbackEffectParameter { return ForceFeedbackEffectParameter(1 << 1) }
	public static var Gain: ForceFeedbackEffectParameter { return ForceFeedbackEffectParameter(1 << 2) }
	public static var TriggerButton: ForceFeedbackEffectParameter { return ForceFeedbackEffectParameter(1 << 3) }
	public static var TriggerRepeatInterval: ForceFeedbackEffectParameter { return ForceFeedbackEffectParameter(1 << 4) }
	public static var Axes: ForceFeedbackEffectParameter { return ForceFeedbackEffectParameter(1 << 5) }
	public static var Direction: ForceFeedbackEffectParameter { return ForceFeedbackEffectParameter(1 << 6) }
	public static var Envelope: ForceFeedbackEffectParameter { return ForceFeedbackEffectParameter(1 << 7) }
	public static var TypeSpecificParamaters: ForceFeedbackEffectParameter { return ForceFeedbackEffectParameter(1 << 8) }
	public static var StartDelay: ForceFeedbackEffectParameter { return ForceFeedbackEffectParameter(1 << 9) }
	
	public static var AllParamaters: ForceFeedbackEffectParameter { return ForceFeedbackEffectParameter(0x000003FF) }
	
	public static var Start: ForceFeedbackEffectParameter { return ForceFeedbackEffectParameter(0x20000000) }
	public static var NoRestart: ForceFeedbackEffectParameter { return ForceFeedbackEffectParameter(0x40000000) }
	public static var NoDownload: ForceFeedbackEffectParameter { return ForceFeedbackEffectParameter(0x80000000) }
	public static var NoTrigger: ForceFeedbackEffectParameter { return ForceFeedbackEffectParameter(0xFFFFFFFF) }
}


public struct ForceFeedbackEffectStart : RawOptionSetType {
	public typealias RawValue = UInt32
	private var value: RawValue = 0
	public init(_ value: RawValue) { self.value = value }
	public init(rawValue value: RawValue) { self.value = value }
	public init(nilLiteral: ()) { self.value = 0 }
	public static var allZeros: ForceFeedbackEffectStart { return self(0) }
	public static func fromMask(raw: RawValue) -> ForceFeedbackEffectStart { return self(raw) }
	public var rawValue: RawValue { return self.value }
	
	public static var Solo: ForceFeedbackEffectStart { return ForceFeedbackEffectStart(0x01) }
	public static var NoDownload: ForceFeedbackEffectStart { return ForceFeedbackEffectStart(0x80000000) }
}

public struct ForceFeedbackEffectStatus : RawOptionSetType {
	public typealias RawValue = UInt32
	private var value: RawValue = 0
	init(_ value: RawValue) { self.value = value }
	public init(rawValue value: RawValue) { self.value = value }
	public init(nilLiteral: ()) { self.value = 0 }
	public static var allZeros: ForceFeedbackEffectStatus { return self(0) }
	public static func fromMask(raw: RawValue) -> ForceFeedbackEffectStatus { return self(raw) }
	public var rawValue: RawValue { return self.value }
	
	public static var NotPlaying: ForceFeedbackEffectStatus { return self(0) }
	public static var Playing: ForceFeedbackEffectStatus { return ForceFeedbackEffectStatus(1 << 0) }
	public static var Emulated: ForceFeedbackEffectStatus { return ForceFeedbackEffectStatus(1 << 1) }
}

public enum ForceFeedbackProperty: UInt32 {
	case Gain = 1
	case Autocenter = 3
}

public struct ForceFeedbackState : RawOptionSetType {
	public typealias RawValue = UInt32
	private var value: RawValue = 0
	init(_ value: RawValue) { self.value = value }
	public init(rawValue value: RawValue) { self.value = value }
	public init(nilLiteral: ()) { self.value = 0 }
	public static var allZeros: ForceFeedbackState { return self(0) }
	public static func fromMask(raw: RawValue) -> ForceFeedbackState { return self(raw) }
	public var rawValue: RawValue { return self.value }
	
	public static var Empty: ForceFeedbackState { return ForceFeedbackState(1 << 0) }
	public static var Stopped: ForceFeedbackState { return ForceFeedbackState(1 << 1) }
	public static var Paused: ForceFeedbackState { return ForceFeedbackState(1 << 2) }
	
	public static var ActuatorsOn: ForceFeedbackState { return ForceFeedbackState(1 << 4) }
	public static var ActuatorsOff: ForceFeedbackState { return ForceFeedbackState(1 << 5) }
	public static var PowerOn: ForceFeedbackState { return ForceFeedbackState(1 << 6) }
	public static var PowerOff: ForceFeedbackState { return ForceFeedbackState(1 << 7) }
	public static var SafetySwitchOn: ForceFeedbackState { return ForceFeedbackState(1 << 8) }
	public static var SafetySwitchOff: ForceFeedbackState { return ForceFeedbackState(1 << 9) }
	public static var UserSwitchOn: ForceFeedbackState { return ForceFeedbackState(1 << 10) }
	public static var UserSwitchOff: ForceFeedbackState { return ForceFeedbackState(1 << 11) }
	public static var DeviceLost: ForceFeedbackState { return ForceFeedbackState(0x80000000) }
}

public class ForceFeedbackDevice {
	private let rawDevice: FFDeviceObjectReference
	
	public init?(device: io_service_t) {
		var tmpDevice: FFDeviceObjectReference = nil
		var iErr = FFCreateDevice(device, &tmpDevice)
		if iErr > -1 {
			rawDevice = tmpDevice
		} else {
			rawDevice = nil
			return nil
		}
	}
	
	public class func deviceIsForceFeedback(device: io_service_t) -> Bool? {
		let iErr = FFIsForceFeedback(device)
		if iErr == 0 {
			return true
		} else if iErr == -2147483644 {
			return false
		} else {
			return nil
		}
	}
	
	public func sendEscape(inout theEscape: FFEFFESCAPE) -> HRESULT {
		return FFDeviceEscape(rawDevice, &theEscape)
	}
	
	public func sendEscape(#command: DWORD, inData: NSData) -> HRESULT {
		let curDataSize = inData.length
		var tmpMutBytes = malloc(UInt(curDataSize))
		memcpy(&tmpMutBytes, inData.bytes, UInt(curDataSize))
		var ourEscape = FFEFFESCAPE(dwSize: DWORD(sizeof(DWORD.Type)), dwCommand: command, lpvInBuffer: tmpMutBytes, cbInBuffer: DWORD(curDataSize), lpvOutBuffer: nil, cbOutBuffer: 0)
		
		let toRet = sendEscape(&ourEscape)
		
		free(tmpMutBytes)
		
		return toRet
	}
	
	public func sendEscape(#command: DWORD, inData: NSData, inout outDataLength: Int) -> (result: HRESULT, outData: NSData) {
		if let ourMutableData = NSMutableData(length: outDataLength) {
			let curDataSize = inData.length
			var tmpMutBytes = malloc(UInt(curDataSize))
			memcpy(&tmpMutBytes, inData.bytes, UInt(curDataSize))
			var ourEscape = FFEFFESCAPE(dwSize: DWORD(sizeof(DWORD.Type)), dwCommand: command, lpvInBuffer: tmpMutBytes, cbInBuffer: DWORD(curDataSize), lpvOutBuffer: ourMutableData.mutableBytes, cbOutBuffer: DWORD(outDataLength))
			
			let toRet = sendEscape(&ourEscape)
			
			free(tmpMutBytes)
			ourMutableData.length = Int(ourEscape.cbOutBuffer)
			
			return (toRet, NSData(data: ourMutableData))
		} else {
			return (-1, NSData())
		}
	}
	
	public var state: ForceFeedbackState {
		var ourState: FFState = 0
		if FFDeviceGetForceFeedbackState(rawDevice, &ourState) >= 0 {
			return ForceFeedbackState(ourState)
		} else {
			return ForceFeedbackState(0)
		}
	}
	
	public func sendForceFeedbackCommand(command: ForceFeedbackCommand) -> HRESULT {
		return FFDeviceSendForceFeedbackCommand(rawDevice, command.rawValue)
	}
	
	public var autocenter: Bool {
		get {
			var theVal: UInt32 = 0
			var iErr = getProperty(.Autocenter, value: &theVal, valueSize: IOByteCount(sizeof(UInt32.Type)))
			return theVal == 1
		}
		set {
			var theVal: UInt32 = newValue == true ? 1 : 0
			var iErr = setProperty(.Autocenter, value: &theVal)
		}
	}
	
	private func setProperty(property: ForceFeedbackProperty, value: UnsafeMutablePointer<Void>) -> HRESULT {
		return FFDeviceSetForceFeedbackProperty(rawDevice, property.rawValue, value)
	}
	
	private func getProperty(property: ForceFeedbackProperty, value: UnsafeMutablePointer<Void>, valueSize: IOByteCount) -> HRESULT {
		return FFDeviceGetForceFeedbackProperty(rawDevice, property.rawValue, value, valueSize)
	}
	
	deinit {
		if rawDevice != nil {
			FFReleaseDevice(rawDevice)
		}
	}
}

public class ForceFeedbackEffect {
	private let rawEffect: FFEffectObjectReference
	unowned private let deviceReference: ForceFeedbackDevice
	// E559C460-C5CD-11D6-8A1C-00039353BD00
	/*!
	@defined kFFEffectType_ConstantForce_ID
	@discussion UUID for a constant force effect type
 */
	public class var ConstantForce: CFUUID {
		return CFUUIDGetConstantUUIDWithBytes(kCFAllocatorDefault,
			0xE5, 0x59, 0xC4, 0x60, 0xC5, 0xCD, 0x11, 0xD6,
			0x8A, 0x1C, 0x00, 0x03, 0x93, 0x53, 0xBD, 0x00)
	}
	
	// E559C461-C5CD-11D6-8A1C-00039353BD00
	/*!
	@defined kFFEffectType_RampForce_ID
	@discussion UUID for a ramp force effect type
 */
	public class var RampForce: CFUUID {
		return CFUUIDGetConstantUUIDWithBytes(kCFAllocatorDefault,
			0xE5, 0x59, 0xC4, 0x61, 0xC5, 0xCD, 0x11, 0xD6,
			0x8A, 0x1C, 0x00, 0x03, 0x93, 0x53, 0xBD, 0x00)
	}
	
	// E559C462-C5CD-11D6-8A1C-00039353BD00
	/*!
	@defined kFFEffectType_Square_ID
	@discussion UUID for a square wave effect type
 */
	public class var Square: CFUUID {
		return CFUUIDGetConstantUUIDWithBytes(kCFAllocatorDefault,
			0xE5, 0x59, 0xC4, 0x62, 0xC5, 0xCD, 0x11, 0xD6,
			0x8A, 0x1C, 0x00, 0x03, 0x93, 0x53, 0xBD, 0x00)
	}
	
	// E559C463-C5CD-11D6-8A1C-00039353BD00
	/*!
	@defined kFFEffectType_Sine_ID
	@discussion UUID for a sine wave effect type
 */
	public class var Sine: CFUUID {
		return CFUUIDGetConstantUUIDWithBytes(kCFAllocatorDefault,
			0xE5, 0x59, 0xC4, 0x63, 0xC5, 0xCD, 0x11, 0xD6,
			0x8A, 0x1C, 0x00, 0x03, 0x93, 0x53, 0xBD, 0x00)
	}
	
	// E559C464-C5CD-11D6-8A1C-00039353BD00
	/*!
	@defined kFFEffectType_Triangle_ID
	@discussion UUID for a triangle wave effect type
 */
	public class var Triangle: CFUUID {
		return CFUUIDGetConstantUUIDWithBytes(kCFAllocatorDefault,
			0xE5, 0x59, 0xC4, 0x64, 0xC5, 0xCD, 0x11, 0xD6,
			0x8A, 0x1C, 0x00, 0x03, 0x93, 0x53, 0xBD, 0x00)
	}
	
	// E559C465-C5CD-11D6-8A1C-00039353BD00
	/*!
	@defined kFFEffectType_SawtoothUp_ID
	@discussion UUID for a upwards sawtooth wave effect type
 */
	public class var SawtoothUp: CFUUID {
		return CFUUIDGetConstantUUIDWithBytes(kCFAllocatorDefault,
			0xE5, 0x59, 0xC4, 0x65, 0xC5, 0xCD, 0x11, 0xD6,
			0x8A, 0x1C, 0x00, 0x03, 0x93, 0x53, 0xBD, 0x00)
	}
	
	// E559C466-C5CD-11D6-8A1C-00039353BD00
	/*!
	@defined kFFEffectType_SawtoothDown_ID
	@discussion UUID for a downwards sawtooth wave effect type
 */
	public class var SawtoothDown: CFUUID {
		return CFUUIDGetConstantUUIDWithBytes(kCFAllocatorDefault,
			0xE5, 0x59, 0xC4, 0x66, 0xC5, 0xCD, 0x11, 0xD6,
			0x8A, 0x1C, 0x00, 0x03, 0x93, 0x53, 0xBD, 0x00)
	}
	
	// E559C467-C5CD-11D6-8A1C-00039353BD00
	/*!
	@defined kFFEffectType_Spring_ID
	@discussion UUID for a spring effect type
 */
	public class var Spring: CFUUID {
		return CFUUIDGetConstantUUIDWithBytes(kCFAllocatorDefault,
			0xE5, 0x59, 0xC4, 0x67, 0xC5, 0xCD, 0x11, 0xD6,
			0x8A, 0x1C, 0x00, 0x03, 0x93, 0x53, 0xBD, 0x00)
	}
	
	// E559C468-C5CD-11D6-8A1C-00039353BD00
	/*!
	@defined kFFEffectType_Damper_ID
	@discussion UUID for a damper effect type
 */
	public class var Damper: CFUUID {
		return CFUUIDGetConstantUUIDWithBytes(kCFAllocatorDefault,
			0xE5, 0x59, 0xC4, 0x68, 0xC5, 0xCD, 0x11, 0xD6,
			0x8A, 0x1C, 0x00, 0x03, 0x93, 0x53, 0xBD, 0x00)
	}
	
	// E559C469-C5CD-11D6-8A1C-00039353BD00
	/*!
	@defined kFFEffectType_Inertia_ID
	@discussion UUID for an inertia effect type
 */
	public class var Inertia: CFUUID {
		return CFUUIDGetConstantUUIDWithBytes(kCFAllocatorDefault,
			0xE5, 0x59, 0xC4, 0x69, 0xC5, 0xCD, 0x11, 0xD6,
			0x8A, 0x1C, 0x00, 0x03, 0x93, 0x53, 0xBD, 0x00)
	}
	
	// E559C46A-C5CD-11D6-8A1C-00039353BD00
	/*!
	@defined kFFEffectType_Friction_ID
	@discussion UUID for a friction effect type
 */
	public class var Friction: CFUUID {
		return CFUUIDGetConstantUUIDWithBytes(kCFAllocatorDefault,
			0xE5, 0x59, 0xC4, 0x6A, 0xC5, 0xCD, 0x11, 0xD6,
			0x8A, 0x1C, 0x00, 0x03, 0x93, 0x53, 0xBD, 0x00)
	}
	
	// E559C46B-C5CD-11D6-8A1C-00039353BD00
	/*!
	@defined kFFEffectType_CustomForce_ID
	@discussion UUID for a custom force effect type
 */
	public class var CustomForce: CFUUID {
		return CFUUIDGetConstantUUIDWithBytes(kCFAllocatorDefault,
			0xE5, 0x59, 0xC4, 0x6B, 0xC5, 0xCD, 0x11, 0xD6,
			0x8A, 0x1C, 0x00, 0x03, 0x93, 0x53, 0xBD, 0x00)
	}
	
	public convenience init?(device: ForceFeedbackDevice, UUID: NSUUID, inout effectDefinition: FFEFFECT) {
		let ourUUID = CFUUIDCreateFromString(kCFAllocatorDefault, UUID.UUIDString)!
		
		self.init(device: device, UUID: ourUUID, effectDefinition: &effectDefinition)
	}
	
	public init?(device: ForceFeedbackDevice, UUID: CFUUID, inout effectDefinition: FFEFFECT) {
		deviceReference = device
		var tmpEffect: FFEffectObjectReference = nil
		let iErr = FFDeviceCreateEffect(device.rawDevice, UUID, &effectDefinition, &tmpEffect)
		if iErr == 0 {
			rawEffect = tmpEffect
		} else {
			rawEffect = nil
		}
	}
	
	deinit {
		if rawEffect != nil {
			FFDeviceReleaseEffect(deviceReference.rawDevice, rawEffect)
		}
	}
}

/*
func FFEffectStart(effectReference: FFEffectObjectReference, iterations: UInt32, flags: ForceFeedbackEffectStartFlag) -> HRESULT {
	return FFEffectStart(effectReference, iterations, flags.rawValue)
}
func FFDeviceGetForceFeedbackProperty(deviceReference: FFDeviceObjectReference, property: ForceFeedbackProperty, pValue: UnsafeMutablePointer<Void>, valueSize: IOByteCount) -> HRESULT {
	return FFDeviceGetForceFeedbackProperty(deviceReference, property.rawValue, pValue, valueSize)
}

func FFDeviceSetForceFeedbackProperty(deviceReference: FFDeviceObjectReference, property: ForceFeedbackProperty, pValue: UnsafeMutablePointer<Void>) -> HRESULT {
	return FFDeviceSetForceFeedbackProperty(deviceReference, property.rawValue, pValue)
}

func FFEffectGetParameters(effectReference: FFEffectObjectReference, pFFEffect: UnsafeMutablePointer<FFEFFECT>, flags: ForceFeedbackEffectParameterFlag) -> HRESULT {
	
}*/