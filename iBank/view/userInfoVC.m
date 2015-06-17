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
    }
    
    _setUserInfoService = [[setUserInfoService alloc] init];
    _setUserInfoService.setUserInfoBlock = ^(int code, id data){
        [indicatorView dismissAtView:[UIApplication sharedApplication].keyWindow];
        if( code == 1 ){
            // 成功
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"保存成功！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [av show];
        }
        else{
            if( [data isKindOfClass:[NSString class]] ){
                NSString *message = (NSString*)data;
                UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [av show];
            }
        }
    };
    
    _setPortraitService = [[setPortraitService alloc] init];
    _setPortraitService.setPortraitBlock = ^(int code, id data){
        [indicatorView dismissAtView:[UIApplication sharedApplication].keyWindow];
        if( code == 1 ){
            // 成功
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"上传成功！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [av show];
        }
        else{
            if( [data isKindOfClass:[NSString class]] ){
                NSString *message = (NSString*)data;
                UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [av show];
            }
        }
    };

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
    _setUserInfoService.nickName = _nickName.text;
    _setUserInfoService.password = _password.text;
    [indicatorView showOnlyIndicatorAtView:[UIApplication sharedApplication].keyWindow];
    [_setUserInfoService request];
}

- (IBAction)onTouchUpload:(id)sender
{
    if( ![[dataHelper helper] checkSessionTimeout] )
    {
        return;
    }
    _setPortraitService.portrait = _portraitImage;
    [indicatorView showOnlyIndicatorAtView:[UIApplication sharedApplication].keyWindow];
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
    if( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary] && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] )
    {
        _popController = [[UIPopoverController alloc] initWithContentViewController:_imagePicker];
        _popController.popoverContentSize = CGSizeMake(320, 320);
        UIButton *button = (UIButton*)sender;
        [_popController presentPopoverFromRect:button.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    }
    else{
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请打开照片库、照相机权限" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [av show];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    _portraitImage = image;
    [_portraitButton setImage:image forState:UIControlStateNormal];
    [_imagePicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    ;
}

@end
