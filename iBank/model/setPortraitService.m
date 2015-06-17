//
//  setPortraitService.m
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
 <tns:setAvatar>
 <sid xsi:type="xsd:string">251f3801-5857-460a-8f41-b7b1bc9968e1</sid>
 <new_data xsi:type="xsd:string">"/9j/4AAQSkZJRgABAQAAAQABAAD//gA+Q1JFQVRPUjogZ2QtanBlZyB2MS4wICh1c2luZyBJSkcgSlBFRyB2ODApLCBkZWZhdWx0IHF1YWxpdHkK/9sAQwAIBgYHBgUIBwcHCQkICgwUDQwLCwwZEhMPFB0aHx4dGhwcICQuJyAiLCMcHCg3KSwwMTQ0NB8nOT04MjwuMzQy/9sAQwEJCQkMCwwYDQ0YMiEcITIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIy/8AAEQgAGQAyAwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A9R0zTtPbSLGRtPglHkoWY265LbMnJxzzzz79cVOmmacT8ul2rHbwDEpAHv0596qhAPB77Qf+Qdl8kD/lmCOvUfh+JrR0kLDolhIzFQLaMrh8MeF5weMct/nmvRqOSvK/Wx5NOMXaLS2uK2kacwdv7PsUAXLBbZSe/bsRx+fNMj0zSQAv9l2zFnxxGh2nJ4zjnjHXg1zElzGnhuHU3lA1dybhJ3B3uwl2HDEYIC4GzOMc4rWvbq4vNM1ZrWCGO2g823YSA+YWCZfnOAB2GDnBzjNW6VRfa62+4lVqb1UVe1/v/r/hzVTR9MldGXTbMKGOcRKRnPQ/KM8kd+gpo0TTpH+TTrbHIJMC8HPPQfXqBjiud886Ulhc2MxFxcWcQuQYWkMSBAPOA7bRxzwfTiul06C1sdFhitnDRJh0bJYkn+L0x19ifTpWdSM4K/M9fX5l0pQqOzitPT5f10PL9UCLq96I1VEE7hVVcADccADtRS6v/wAhm++Yt/pEnzHv8x5or6Gn8KPm6nxv1PS9PhMvhe1DkGBrRUkj4UlSgB57Z9vbvT4LCG0WJoWvR5QASMzyMFPQLhvlxjjp3715LRXnPLm2/f38v+CemszSS9zbz/4B6r/ZGnTXbyeVktIZHjWRgm/O0MoBA3YPBx1OfcLNpdrdSSTSwqxlURzFtyowxhQwBAPHIOMj5ea8pop/2fP/AJ+P+vmL+0Yf8+1/XyPW7TTLO3aVraKRSQkZJ+YtsBCj5umBjgdhzUtva2tjbmG1jWKOJSEDMzgZxnrzwWPB7n2rx+ipeWye8/w/4JSzSK2p/j/wC5qx3axfHnm4kPJyfvGiqdFenFWSR5UnzNs//9k="</new_data>
 </tns:setAvatar>
 </soap:Body>
 </soap:Envelope>
 
 ResponseCode: 200 (OK)
 Vary:Accept-Encoding
 Content-Length:553
 Content-Type:text/xml; charset=utf-8
 Date:Tue, 16 Jun 2015 23:27:29 GMT
 Server:Apache/2.2.22 (Ubuntu)
 X-Powered-By:PHP/5.4.39-1+deb.sury.org~precise+2
 
 <?xml version="1.0" encoding="utf-16"?>
 <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns1="urn:UserOptControllerwsdl" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
 <SOAP-ENV:Body>
 <ns1:setAvatarResponse>
 <return xsi:type="xsd:string">{"result":1,"data":"更新成功!"}</return>
 </ns1:setAvatarResponse>
 </SOAP-ENV:Body>
 </SOAP-ENV:Envelope>
 
 
 "{
 ""result"": ""1"",
 ""data"": ""更新成功""
 }"
 */

#import "setPortraitService.h"
#import "dataHelper.h"
#import "Utility.h"

@implementation setPortraitService


- (id)init
{
    self = [super init];
    if( self ){
        self.soapAction = @"urn:UserOptControllerwsdl/setAvatar";
        self.package = @"ibankbiz/user-opt";
    }
    return self;
}


- (void)request
{
    NSData *data = UIImageJPEGRepresentation(_portrait, 1.0f);
    NSString *b64Encode = [data base64Encoding];
    NSMutableString *body = [[NSMutableString alloc] initWithCapacity:0];
    [body appendString:@"<tns:setAvatar>\n"];
    [body appendFormat:@"<sid xsi:type=\"xsd:string\">%@</sid>\n",[dataHelper helper].sessionid];
    [body appendFormat:@"<new_data xsi:type=\"xsd:string\">%@</new_data>\n", b64Encode];
    [body appendString:@"</tns:setAvatar>"];
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
    if( self.setPortraitBlock ){
        self.setPortraitBlock( code.intValue, data );
    }
}

- (void)onError:(NSString *)error
{
    if( self.setPortraitBlock ){
        self.setPortraitBlock( 99, @"无法连接服务器！" );
    }
}


@end
