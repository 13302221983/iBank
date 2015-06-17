//
//  setUserInfoService.m
//  iBank
//
//  Created by McKee on 15/6/17.
//  Copyright (c) 2015年 McKee. All rights reserved.
//

/*
 http://222.49.117.9/ibankbizdev/index.php/ibankbiz/user-opt
 
 <?xml version="1.0" encoding="utf-16"?>
 <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tns="urn:UserOptControllerwsdl" xmlns:types="urn:UserOptControllerwsdl/encodedTypes" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
 <soap:Body soap:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
 <tns:setUserInfo>
 <sid xsi:type="xsd:string">22c0eca8-ee20-4bb1-aad5-8be46e67f0f0</sid>
 <new_data xsi:type="xsd:string">{"name":"快乐的李四","pwd":"admin"}</new_data>
 </tns:setUserInfo>
 </soap:Body>
 </soap:Envelope>
 
 ResponseCode: 200 (OK)
 Vary:Accept-Encoding
 Keep-Alive:timeout=3, max=100
 Connection:Keep-Alive
 Content-Length:580
 Content-Type:text/xml; charset=utf-8
 Date:Tue, 16 Jun 2015 23:14:55 GMT
 Server:Apache/2.2.22 (Ubuntu)
 X-Powered-By:PHP/5.4.39-1+deb.sury.org~precise+2
 
 <?xml version="1.0" encoding="utf-16"?>
 <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns1="urn:UserOptControllerwsdl" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
 <SOAP-ENV:Body>
 <ns1:setUserInfoResponse>
 <return xsi:type="xsd:string">{"result":0,"data":{"error_message":"用户会话过期"}}</return>
 </ns1:setUserInfoResponse>
 </SOAP-ENV:Body>
 </SOAP-ENV:Envelope>
 
 ResponseCode: 200 (OK)
 Vary:Accept-Encoding
 Keep-Alive:timeout=3, max=100
 Connection:Keep-Alive
 Content-Length:557
 Content-Type:text/xml; charset=utf-8
 Date:Tue, 16 Jun 2015 23:19:05 GMT
 Server:Apache/2.2.22 (Ubuntu)
 X-Powered-By:PHP/5.4.39-1+deb.sury.org~precise+2
 
 <?xml version="1.0" encoding="utf-16"?>
 <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns1="urn:UserOptControllerwsdl" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
 <SOAP-ENV:Body>
 <ns1:setUserInfoResponse>
 <return xsi:type="xsd:string">{"result":1,"data":"更新成功!"}</return>
 </ns1:setUserInfoResponse>
 </SOAP-ENV:Body>
 </SOAP-ENV:Envelope>
 */

#import "setUserInfoService.h"


@implementation setUserInfoService

@end
