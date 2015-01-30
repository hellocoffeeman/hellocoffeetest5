//
//  ChangeSelfViewController.m
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/20.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "ChangeSelfViewController.h"

#import "VPImageCropperViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>

#define ORIGINAL_MAX_WIDTH self.view.frame.size.height
#define head_w 120
#define btn_w  60
#define head_y 40
#define backImg_h 70
#define back_dis_head 10
@interface ChangeSelfViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate,VPImageCropperDelegate>
{
    UIImagePickerController *_pickImg;
}

@property(nonatomic,strong)UIButton *headBtn;

@end

@implementation ChangeSelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    
    _pickImg = [[UIImagePickerController alloc]init];
    _pickImg.delegate = self;//添加两个代理方法
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    [self makeNavWithTitleLabel:@"个人信息" withRightBtn:YES rightButtonTitle:nil rightBtnImageURL:@"wanchengtubiao" target:self  rightBtnAction:@selector(tiJiaoXiuGai)];
    [self createView];
    [self addTap];
}
//-(void)viewDidAppear:(BOOL)animated
//{
//   self.tabBarController.tabBar.hidden = YES;
//}
-(void)addTap
{
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDown:)];
    [self.view addGestureRecognizer:tap];
}

-(void)tapDown:(UITapGestureRecognizer *)tap
{
    [UIView animateWithDuration:0.3 animations:^{
         self.view.frame=self.view.bounds;
    }];
   
    [self.text1 resignFirstResponder];
    [self.text2 resignFirstResponder];
}
-(void)createView
{
    UIImageView *touxiang=[[UIImageView alloc] initWithFrame:CGRectMake((s_width-head_w)/2.0, head_y+64, head_w, head_w)];
    touxiang.image=[UIImage imageNamed:@"touxiang@2x.png"];
    [self.view addSubview:touxiang];
    self.headImg=touxiang;
    self.headImg.userInteractionEnabled=YES;
    self.headImg.layer.cornerRadius=self.headImg.frame.size.width/2.0;
    self.headImg.layer.masksToBounds=YES;
    self.headImg.layer.borderColor=[UIColor whiteColor].CGColor;
    self.headImg.layer.borderWidth=2.0;
    
    _headBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [_headBtn setBackgroundImage:[UIImage imageNamed:@"genghuantouxiangtubiao@2x"] forState:UIControlStateNormal];
   
    _headBtn.frame=CGRectMake(head_w/4.0, head_w/4.0, head_w/2.0, head_w/2.0);
     //_headBtn.center=touxiang.center;
    [self.headImg addSubview:_headBtn];
    [self.headBtn addTarget:self action:@selector(showActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *back1=[[UIImageView alloc] initWithFrame:CGRectMake(0, _headImg.frame.origin.x+_headImg.frame.size.height+back_dis_head, s_width, backImg_h)];
    back1.userInteractionEnabled=YES;
    back1.image=[UIImage imageNamed:@"xiugaidise@2x"];
    [self.view addSubview:back1];
    
    UILabel *lab1=[[UILabel alloc] initWithFrame:CGRectMake(10, 0, 150, backImg_h)];
    lab1.text=@"用户昵称";
    lab1.textAlignment=NSTextAlignmentLeft;
    lab1.textColor=[UIColor grayColor];
    lab1.font=[UIFont systemFontOfSize:20];
    [back1 addSubview:lab1];
    
    UITextField *text1=[[UITextField alloc] initWithFrame:CGRectMake(lab1.frame.size.width, 0, s_width-(lab1.frame.size.width+20)-10, backImg_h)];
      text1.text=@"Glory";
    [back1 addSubview:text1];
    text1.textColor=[UIColor grayColor];
    text1.font=[UIFont systemFontOfSize:20];
    text1.textAlignment=NSTextAlignmentLeft;
    _text1=text1;
    _text1.delegate=self;
   
    //_text1.enabled=NO;
  
   
    
    
    
    UIImageView *back2=[[UIImageView alloc] initWithFrame:CGRectMake(0, back1.frame.size.width+back1.frame.origin.x, s_width, backImg_h)];
    back2.userInteractionEnabled=YES;
    back2.image=[UIImage imageNamed:@"xiugaidise@2x"];
    [self.view addSubview:back2];
    
    UILabel *lab2=[[UILabel alloc] initWithFrame:CGRectMake(10, 0, 150, backImg_h)];
    lab2.text=@"个人描述";
    lab2.textAlignment=NSTextAlignmentLeft;
    lab2.textColor=[UIColor grayColor];
    lab2.font=[UIFont systemFontOfSize:20];
    [back2 addSubview:lab2];

    UITextField *text2=[[UITextField alloc] initWithFrame:CGRectMake(lab2.frame.size.width, 0, s_width-(lab2.frame.size.width+20)-10, backImg_h)];
    text2.text=@"美食编辑";
    [back2 addSubview:text2];
    text2.textColor=[UIColor grayColor];
    text2.font=[UIFont systemFontOfSize:20];
    _text2=text2;
    _text2.delegate=self;
    text2.textAlignment=NSTextAlignmentLeft;
  //  _text2.enabled=NO;
    
}

#pragma mark textfiled

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
  if(self.text2==textField)
  {
      [UIView animateWithDuration:0.3 animations:^{
          self.view.frame=CGRectMake(0, -80, self.view.frame.size.width, self.view.frame.size.height);
      }];
      
  }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame=self.view.bounds;
    }];
    if(self.text1==textField)
    {
        [self.text1 resignFirstResponder];
        [self.text2 becomeFirstResponder];
    }
    
    [textField resignFirstResponder];
   
    return YES;
}
#pragma mark -
#pragma mark 提交修改按钮
-(void)tiJiaoXiuGai
{
    NSLog(@"提交修改的按钮/走代理方法/");
    NSLog(@"self.delegate=%@",self.delegate);
    [self.delegate set];
}
#pragma mark -
#pragma mark 照相机事件

//照相机监听事件
-(void)showActionSheet:(UIButton *)button
{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"图片选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册",nil];
    [sheet showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
        //        // 拍照
        if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypeCamera;
            if ([self isFrontCameraAvailable]) {
                controller.cameraDevice = UIImagePickerControllerCameraDeviceRear   ;
            }
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            [self presentViewController:controller
                               animated:YES
                             completion:^(void){
                                 NSLog(@"Picker View Controller is presented");
                             }];
        }
        
    } else if (buttonIndex == 1) {
        // 从相册中选取
        if ([self isPhotoLibraryAvailable]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            [self presentViewController:controller
                               animated:YES
                             completion:^(void){
                                 NSLog(@"Picker View Controller is presented");
                             }];
        }
    }
    
}
#pragma mark -
#pragma mark VPI的代理 裁剪后返回
- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
     self.headImg.image = editedImage;
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)imageCropperDidCancel:(VPImageCropperViewController *)cropperViewController {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
}
#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^() {
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        portraitImg = [self imageByScalingToMaxSize:portraitImg];
// 裁剪
        
        VPImageCropperViewController *imgEditorVC = [[VPImageCropperViewController alloc] initWithImage:portraitImg cropFrame:CGRectMake(self.view.frame.size.width/2-100, self.view.frame.size.height/2-100, 200, 200) limitScaleRatio:3.0];
        imgEditorVC.delegate = self;
        [self presentViewController:imgEditorVC animated:YES completion:^{
            // TO DO
        }];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^(){
    }];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

#pragma mark camera utility
- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (BOOL) isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

- (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickVideosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickPhotosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}

#pragma mark image scale utility
- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage {
    if (sourceImage.size.width < ORIGINAL_MAX_WIDTH) return sourceImage;
    CGFloat btWidth = 0.0f;
    CGFloat btHeight = 0.0f;
    if (sourceImage.size.width > ORIGINAL_MAX_WIDTH) {
        btHeight = ORIGINAL_MAX_WIDTH;
        btWidth = sourceImage.size.width * (ORIGINAL_MAX_WIDTH / sourceImage.size.height);
    } else {
        btWidth = ORIGINAL_MAX_WIDTH;
        btHeight = sourceImage.size.height * (ORIGINAL_MAX_WIDTH / sourceImage.size.width);
    }
    CGSize targetSize =  CGSizeMake(sourceImage.size.width, sourceImage.size.height);
    //    CGSize targetSize = CGSizeMake(btWidth, btHeight);
    NSLog(@"width = %f \n height =%f",targetSize.width,targetSize.height);
    return [self imageByScalingAndCroppingForSourceImage:sourceImage targetSize:targetSize];
}

- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize {
    UIImage *newImage = nil;
    //    targetSize.width=100;
    //    targetSize.height=100;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    //    CGFloat scaledWidth = 100;
    //    CGFloat scaledHeight = 100;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}






@end
