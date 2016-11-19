//
//  WebPDecoder.swift
//  WebP
//
//  Created by Namai Satoshi on 2016/10/24.
//  Copyright © 2016年 satoshi.namai. All rights reserved.
//

import Foundation
import CWebP

public struct WebPDecoder {
    init() {
    }
    
    public func decode(ARGB: UnsafeMutablePointer<UInt8>, config: WebP.WebPDecoderConfig,
                       size: Int, width: Int, height: Int) throws -> Data {
        return Data()
    }
    
    public func decode(BGRA: UnsafeMutablePointer<UInt8>, config: WebP.WebPDecoderConfig,
                       size: Int, width: Int, height: Int) throws -> Data {
        return Data()
    }
    
    public func decode(RGB: UnsafeMutablePointer<UInt8>, config: WebP.WebPDecoderConfig,
                       size: Int, width: Int, height: Int) throws -> Data {
        return Data()
    }
    
    public func decode(BGR: UnsafeMutablePointer<UInt8>, config: WebP.WebPDecoderConfig,
                       size: Int, width: Int, height: Int) throws -> Data {
        return Data()
    }
    
    private func decode(dataPtr: UnsafeMutablePointer<UInt8>, config: WebP.WebPDecoderConfig,
                        size: Int, width: Int, height: Int) throws -> Data {
        var originalConfig = config.rawValue
        
        if WebPInitDecoderConfig(&originalConfig) == 0 {
            fatalError("can't init decoder config")
        }
        
        var features = originalConfig.input
        if WebPGetFeatures(dataPtr, size, &features) != VP8_STATUS_OK {
            fatalError("can't get features by CWebP.WebPGetFeatures")
        }
        
        originalConfig.output.colorspace = MODE_RGBA
        
        if WebPDecode(dataPtr, size, &originalConfig) != VP8_STATUS_OK {
            fatalError("can't decode data by CWebP.WebPDecode")
        }

        return Data()
    }
}
