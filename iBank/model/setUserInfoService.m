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
#import "dataHelper.h"
#import "Utility.h"


@implementation setUserInfoService

- (id)init
{
    self = [super init];
    if( self ){
        self.soapAction = @"urn:UserOptControllerwsdl/setUserInfo";
        self.package = @"ibankbiz/user-opt";
    }
    return self;
}


- (void)request
{
    NSString *data = [NSString stringWithFormat:@"{\"name\":\"%@\",\"pwd\":\"%@\"}", _nickName, _password];
    NSMutableString *body = [[NSMutableString alloc] initWithCapacity:0];
    [body appendString:@"<tns:setUserInfot>\n"];
    [body appendFormat:@"<sid xsi:type=\"xsd:string\">%@</sid>\n",[dataHelper helper].sessionid];
    [body appendFormat:@"<new_data xsi:type=\"xsd:string\">%@</new_data>\n", data];
    [body appendString:@"</tns:setUserInfo>"];
    self.soapBody = body;
    [super request];
}


- (void)parseResult:(NSString *)result
{
    NSDictionary *dict = [Utility dictionaryWithJsonString:result];
    NSNumber *code;
    NSString *data;
    if( dict ){
        code = [dict objectForKey:@"result"];
        data = [dict objectForKey:@"data"];
    }
    if( self.setUserInfoBlock ){
        self.setUserInfoBlock( code.intValue, data );
    }
}

- (void)onError:(NSString *)error
{
    if( self.setUserInfoBlock ){
        self.setUserInfoBlock( 99, @"无法连接服务器！" );
    }
}

@end
