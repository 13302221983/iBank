//
//  userInfoVC.m
//  iBank
//
//  Created by McKee on 15/6/16.
//  Copyright (c) 2015年 McKee. All rights reserved.
//

#import "userInfoVC.h"
#import "dataHelper.h"
#import "indicatorView.h"
#import "setUserInfoService.h"
#import "setPortraitService.h"
#import <QuartzCore/QuartzCore.h>

@interface userInfoVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImagePickerController *_imagePicker;
    UIPopoverController *_popController;
    setUserInfoService *_setUserInfoService;
    setPortraitService *_setPortraitService;
    UIImage *_portraitImage;
}

@property IBOutlet UITextField *account;

@property IBOutlet UITextField *nickName;

@property IBOutlet UITextField *password;

@property IBOutlet UIButton *portraitButton;

@property UIImage *portraitImage;

@end

@implementation userInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _account.text = [dataHelper helper].loginAccount;
    _nickName.text = [dataHelper helper].nickName;
    _password.text = [dataHelper helper].password;
    if( [dataHelper helper].portraitImage ){
        [_portraitButton setImage:[dataHelper helper].portraitImage forState:UIControlStateNormal];
        _portraitImage = [dataHelper helper].portraitImage;
    }
    else{
        _portraitImage = _portraitButton.imageView.image;
        [dataHelper helper].portraitImage = _portraitImage;
    }
    
    __weak userInfoVC *weakSelf = self;
    _setUserInfoService = [[setUserInfoService alloc] init];
    _setUserInfoService.setUserInfoBlock = ^(int code, id data){
        if( code == 1 ){
            // 成功
            /*
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"保存成功！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [av show];
            */
            setPortraitService *setPortraitSrv = [[setPortraitService alloc] init];
            setPortraitSrv.portrait = weakSelf.portraitImage;
            setPortraitSrv.setPortraitBlock = ^(int status, id msg){
               [indicatorView dismissAtView:[UIApplication sharedApplication].keyWindow];
               if( status == 1 ){
                    [dataHelper helper].nickName = weakSelf.nickName.text;
                    [dataHelper helper].password = weakSelf.password.text;
                    [dataHelper helper].portraitImage = weakSelf.portraitImage;
                    if( weakSelf.block ){
                        weakSelf.block( weakSelf.portraitImage, weakSelf.nickName.text );
                    }
                    [weakSelf dismissViewControllerAnimated:YES completion:nil];
                }
                else{
                    if( [msg isKindOfClass:[NSString class]] ){
                        NSString *message = (NSString*)msg;
                        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                        [av show];
                    }
                }
            };
            [setPortraitSrv request];
        }
        else{
            [indicatorView dismissAtView:[UIApplication sharedApplication].keyWindow];
            if( [data isKindOfClass:[NSString class]] ){
                NSString *message = (NSString*)data;
                UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [av show];
            }
        }
    };
    
    /*
    _setPortraitService = [[setPortraitService alloc] init];
    _setPortraitService.setPortraitBlock = ^(int code, id data){
        [indicatorView dismissAtView:[UIApplication sharedApplication].keyWindow];
        if( code == 1 ){
            // 成功
            [dataHelper helper].portraitImage = weakSelf.portraitImage;
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"上传成功！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [av show];
            if( weakSelf.block ){
                weakSelf.block( weakSelf.portraitImage, nil );
            }
        }
        else{
            if( [data isKindOfClass:[NSString class]] ){
                NSString *message = (NSString*)data;
                UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [av show];
            }
        }
    };
    */

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onTouchSave:(id)sender
{
    if( ![[dataHelper helper] checkSessionTimeout] )
    {
        return;
    }
    
    NSData *portraitData = UIImageJPEGRepresentation(_portraitImage, 1.0f);
    NSData *oldPortraitData = UIImageJPEGRepresentation([dataHelper helper].portraitImage, 1.0f);
    if( [oldPortraitData isEqualToData:portraitData] ){
        if( [_nickName.text isEqualToString:[dataHelper helper].nickName] && [_password.text isEqualToString:[dataHelper helper].password] ){
            [self dismissViewControllerAnimated:YES completion:nil];
            return;
        }
    }
    
    if( _nickName.text.length == 0 ){
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入昵称！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [av show];
        return;
    }
    
    if( _nickName.text.length > 32 )
    {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"昵称不能超过16个中文字符！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [av show];
        return;
    }
    
    if( _password.text.length == 0 ){
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入密码！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [av show];
        return;
    }
    
    if( _password.text.length > 16 ){
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码不能超过16个字符！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [av show];
        return;
    }
    
    _setUserInfoService.nickName = _nickName.text;
    _setUserInfoService.password = _password.text;
    [indicatorView showMessage:@"正在保存..." atView:[UIApplication sharedApplication].keyWindow];
    [_setUserInfoService request];
}

- (IBAction)onTouchUpload:(id)sender
{
    if( ![[dataHelper helper] checkSessionTimeout] )
    {
        return;
    }
    _setPortraitService.portrait = _portraitImage;
    [indicatorView showMessage:@"正在上传头像..." atView:[UIApplication sharedApplication].keyWindow];
    [_setPortraitService request];
}

- (IBAction)onTouchCancel:(id)sender
{
    if( ![[dataHelper helper] checkSessionTimeout] )
    {
        return;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onTouchPortrait:(id)sender
{
    if( ![[dataHelper helper] checkSessionTimeout] )
    {
        return;
    }
    if( _popController.isPopoverVisible ){
        [_popController dismissPopoverAnimated:NO];
    }
    
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.delegate = self;
    if( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary] )
    {
        [dataHelper helper].pop = [[UIPopoverController alloc] initWithContentViewController:_imagePicker];
        [dataHelper helper].pop.popoverContentSize = CGSizeMake(320, 320);
        UIButton *button = (UIButton*)sender;
        [[dataHelper helper].pop presentPopoverFromRect:button.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
    }
    else{
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请打开照片库" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [av show];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    _portraitImage = image;
    CGRect portraitFrame = _portraitButton.frame;
    CGFloat height = portraitFrame.size.height;
    CGFloat width = (image.size.width / image.size.height) * height;
    CGSize size = CGSizeMake(width, height);
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    _portraitImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    portraitFrame.size = CGSizeMake(width, height);
    _portraitButton.frame = portraitFrame;
    [_portraitButton setImage:_portraitImage forState:UIControlStateNormal];
    [_imagePicker dismissViewControllerAnimated:YES completion:^(void){
    }];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    ;
}

@end
