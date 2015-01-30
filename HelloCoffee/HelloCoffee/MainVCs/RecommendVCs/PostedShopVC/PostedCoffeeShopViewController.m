//
//  faBuDianPu.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/7.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "PostedCoffeeShopViewController.h"
#import "LabelFieldView.h"

#define kLabelFieldHeight (s_width/6.53)
#define kUploadImageLFHeight (s_width/2.91)
#define kLeftLabelWidth 90
#define kRightFieldFontSize 16.0

@interface PostedCoffeeShopViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;

@property (weak, nonatomic) IBOutlet LabelFieldView *shopNameLF; // 店铺名称
@property (weak, nonatomic) IBOutlet LabelFieldView *shopAddressLF; // 店铺店址
@property (weak, nonatomic) IBOutlet LabelFieldView *detailAddressLF; // 详细店址
@property (weak, nonatomic) IBOutlet LabelFieldView *permitPhotoLF; // 营业执照
@property (weak, nonatomic) IBOutlet LabelFieldView *uploadImageLF; // 店铺相片

@property (weak, nonatomic) IBOutlet LabelFieldView *idNumberLF; // 身份证号
@property (weak, nonatomic) IBOutlet LabelFieldView *realNameLF; // 真实姓名
@property (weak, nonatomic) IBOutlet LabelFieldView *phoneNumberLF; // 手机号

@property (weak, nonatomic) IBOutlet UIButton *shopkeeperApplyButton; // (跳转)商家申请
@property (weak, nonatomic) IBOutlet UIButton *submitButton; // 用户提交
@property (weak, nonatomic) IBOutlet UIButton *shopKeeperSubmitButton; // 商家提交

@property (weak, nonatomic) IBOutlet UILabel *wordsLabel; // Words Label
@property (nonatomic, strong) UIButton *chooseButton; // 选择图片的Button

@property (nonatomic, strong) IBOutlet UIView *twoTableView; //
@property (nonatomic, strong) IBOutlet UITableView *centerTableView; // 中 TableView
@property (nonatomic, strong) IBOutlet UITableView *rightTableView; // 右 TableView

@property (nonatomic, strong) NSArray *cityArray; // 可选城市 Array
@property (nonatomic, strong) NSArray *countyArray; // 可选区/县 Array

@end

@implementation PostedCoffeeShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self makeNavWithTitleLabel:@"创建店铺" withRightBtn:nil rightButtonTitle:nil rightBtnImageURL:nil target:nil rightBtnAction:nil];
    self.view.backgroundColor = kBackColor;
    
    //  - 视图控件 -
    [self setSubviewsFrameAndData]; // 子试图
    
    [self setTwoTableViewFrameAndData]; // 选地址 tableview
    
    //  - 数据 -
    self.cityArray = @[@"北京市"];
    self.countyArray = @[@"东城区",@"西城区",@"朝阳区",@"海淀区",@"丰台区",@"石景山区",@"门头沟区",@"房山区",@"大兴区",@"通州区",@"顺义区",@"昌平区",@"平谷区",@"怀柔区",@"密云县",@"延庆县"];
    
}

#pragma mark - Set Frame -
-(void)setSubviewsFrameAndData
{
    self.mainScrollView.frame = self.view.bounds;
    
    //  - 店铺名称 -
    self.shopNameLF.frame = CGRectMake(0, 64, s_width, kLabelFieldHeight);
    [self.shopNameLF setLeftLabelWithWidth:kLeftLabelWidth labelHeight:kLabelFieldHeight labelText:@"店铺名称" rightPlaceholder:@"请输入店铺名称" rightFontSize:kRightFieldFontSize delegate:self];
    
    //  - 店铺店址 -
    self.shopAddressLF.frame = CGRectMake(0, 64+kLabelFieldHeight, s_width, kLabelFieldHeight);
    [self.shopAddressLF setLeftLabelWithWidth:kLeftLabelWidth labelHeight:kLabelFieldHeight labelText:@"店铺店址" buttonTarget:self centerBtnAction:@selector(showChooseAddressTableView:) rightBtnAction:@selector(showChooseAddressTableView:)];
    
    //  - 详细店址 -
    self.detailAddressLF.frame = CGRectMake(0, 64+kLabelFieldHeight*2, s_width, kLabelFieldHeight);
    [self.detailAddressLF setLeftLabelWithWidth:0 labelHeight:kLabelFieldHeight labelText:nil rightPlaceholder:@"请输入详细店铺地址" rightFontSize:kRightFieldFontSize delegate:self];
    
    //  - 营业执照 -
    self.permitPhotoLF.frame = CGRectMake(0, 64+kLabelFieldHeight*3, s_width, kLabelFieldHeight);
    [self.permitPhotoLF setLeftLabelWithWidth:kLeftLabelWidth labelHeight:kLabelFieldHeight labelText:@"营业执照" rightButtonTarget:self action:@selector(showActionSheet:)];
    
    //  - 店铺背景图 -
    self.uploadImageLF.frame = CGRectMake(0, 64+kLabelFieldHeight*(3+self.applyFrom), s_width, kUploadImageLFHeight);
    [self.uploadImageLF setLabelWithHeight:49 labelText:@"店铺背景图" addImageButtonTarget:self action:@selector(showActionSheet:)];
    self.uploadImageLF.segmentView.frame = CGRectMake(0, kUploadImageLFHeight-1, s_width, 1);
    
    //  - 身份证号 -
    self.idNumberLF.frame = CGRectMake(0, 64+kLabelFieldHeight*(3+self.applyFrom)+kUploadImageLFHeight+30, s_width, kLabelFieldHeight);
    [self.idNumberLF setLeftLabelWithWidth:kLeftLabelWidth labelHeight:kLabelFieldHeight labelText:@"身份证号" rightPlaceholder:@"请输入您的身份证号" rightFontSize:kRightFieldFontSize delegate:self];
    UIView *upView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, s_width, 1)];
    upView.backgroundColor = [UIColor lightGrayColor];
    [self.idNumberLF addSubview:upView]; // 顶部分界线
    
    //  - 真实姓名 -
    self.realNameLF.frame = CGRectMake(0, 64+kLabelFieldHeight*(3+self.applyFrom*2)+kUploadImageLFHeight+30, s_width, kLabelFieldHeight);
    [self.realNameLF setLeftLabelWithWidth:kLeftLabelWidth labelHeight:kLabelFieldHeight labelText:@"真实姓名" rightPlaceholder:@"请输入您的真实姓名" rightFontSize:kRightFieldFontSize delegate:self];
    
    //  - 手机号 -
    self.phoneNumberLF.frame = CGRectMake(0,64+kLabelFieldHeight*(4+self.applyFrom*2)+kUploadImageLFHeight+30, s_width, kLabelFieldHeight);
    [self.phoneNumberLF setLeftLabelWithWidth:kLeftLabelWidth labelHeight:kLabelFieldHeight labelText:@"手机号" rightPlaceholder:@"请输入您的手机号" rightFontSize:kRightFieldFontSize delegate:self];
    self.phoneNumberLF.segmentView.frame = CGRectMake(0, self.phoneNumberLF.segmentView.frame.origin.y, s_width, 1);
    
    //  - Button -
    self.shopkeeperApplyButton.frame = CGRectMake(s_width/19.19, self.phoneNumberLF.frame.origin.y+kLabelFieldHeight+s_width/20, s_width/2.37, s_width/8);
    self.submitButton.frame = CGRectMake(s_width/2+s_width/19.19/2, self.shopkeeperApplyButton.frame.origin.y, s_width/2.37, s_width/8);
    self.shopKeeperSubmitButton.frame = CGRectMake((s_width-s_width/1.3)/2, self.shopkeeperApplyButton.frame.origin.y, s_width/1.3, s_width/8);
    
    //  - Words Label -
    self.wordsLabel.frame = CGRectMake(10, self.shopkeeperApplyButton.frame.origin.y+s_width/8 + s_width/32, s_width-20, 50);
    // 文字行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:8.0];//调整行间距
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.wordsLabel.text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.wordsLabel.text length])];
    self.wordsLabel.attributedText = attributedString;
    
    //  - Main Scroll View -
    if (self.applyFrom == Apply_By_Customer) {
        self.mainScrollView.scrollEnabled = NO;
        self.permitPhotoLF.hidden = YES;
        self.idNumberLF.hidden = YES;
        self.shopKeeperSubmitButton.hidden = YES;
        
        UIView *upView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, s_width, 1)];
        upView.backgroundColor = [UIColor lightGrayColor];
        [self.realNameLF addSubview:upView]; // 顶部分界线
        
    }else{
        self.mainScrollView.scrollEnabled = YES;
        self.shopkeeperApplyButton.hidden = YES;
        self.submitButton.hidden = YES;
        self.mainScrollView.contentSize = CGSizeMake(s_width, self.wordsLabel.frame.origin.y+65);
    }
    
}

#pragma mark - Set Two TableView -
-(void)setTwoTableViewFrameAndData
{
    self.twoTableView.frame = CGRectMake(self.shopAddressLF.centerButton.frame.origin.x, self.detailAddressLF.frame.origin.y-15, self.shopAddressLF.centerButton.frame.size.width+self.shopAddressLF.rightButton.frame.size.width , 150);
    self.centerTableView.frame = CGRectMake(0, 0, self.shopAddressLF.centerButton.frame.size.width, 150);
    self.rightTableView.frame = CGRectMake(self.shopAddressLF.centerButton.frame.size.width+1, 0, self.shopAddressLF.rightButton.frame.size.width-1, 150);
    
    self.centerTableView.bounces = NO;
    self.centerTableView.delegate = self;
    self.centerTableView.dataSource = self;
    self.centerTableView.separatorColor = [UIColor clearColor];
    
    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
    self.rightTableView.separatorColor = [UIColor clearColor];
    
    self.twoTableView.backgroundColor = kBackColor;
    self.twoTableView.alpha = 0.89;
    self.twoTableView.hidden = YES;
    
}

#pragma mark -
#pragma mark - TextField -
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([textField isEqual:self.idNumberLF.rightTextField] || [textField isEqual:self.realNameLF.rightTextField] || [textField isEqual:self.phoneNumberLF.rightTextField]) {
        
        [self.view bringSubviewToFront:self.navBackView];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        self.view.frame = CGRectMake(0, -170, s_width, s_height);
//        self.navBackView.frame = CGRectMake(0, 170, s_width, 64);
        self.backCleanView.frame = CGRectMake(0, 170, s_width, 64);
        [UIView setAnimationDelegate:self];
        [UIView commitAnimations];
        
    }
    else {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        self.view.frame = CGRectMake(0, 0, s_width, s_height);
//        self.navBackView.frame = CGRectMake(0, 0, s_width, 64);
        self.backCleanView.frame = CGRectMake(0, 0, s_width, 64);
        [UIView setAnimationDelegate:self];
        [UIView commitAnimations];
    }
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.view.frame = CGRectMake(0, 0, s_width, s_height);
//    self.navBackView.frame = CGRectMake(0, 0, s_width, 64);
    self.backCleanView.frame = CGRectMake(0, 0, s_width, 64);
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
    return YES;
}

#pragma mark - TableView  -
#pragma mark - TableView Selecte -
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.centerTableView]) {
        [self.shopAddressLF.centerButton setTitle:self.cityArray[indexPath.row] forState:UIControlStateNormal];
    }else{
        [self.shopAddressLF.rightButton setTitle:self.countyArray[indexPath.row] forState:UIControlStateNormal];
    }
//    self.twoTableView.hidden = YES;
}

#pragma mark - TableView Cell -
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if ([tableView isEqual:self.centerTableView]) {
        cell.textLabel.text = self.cityArray[indexPath.row];
    }else{
        cell.textLabel.text = self.countyArray[indexPath.row];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:self.centerTableView]) {
        return self.cityArray.count;
    }
    return self.countyArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}



#pragma mark -
#pragma mark - Address Action -
-(void)showChooseAddressTableView:(UIButton *)button
{
    self.twoTableView.hidden = !self.twoTableView.hidden;
    
}


#pragma mark -
#pragma mark - Photo Action -
-(void)showActionSheet:(UIButton *)button
{
    self.chooseButton = button;
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍摄图片上传",@"从相册中选取图片", nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button At Index = %d",(int)buttonIndex);
    switch (buttonIndex) {
        case 0: // 打开相机
            [self openPhotoCamera];
            break;
        case 1: // 打开相册
            [self openPhotoAlbum];
            break;
    }
}

-(void)openPhotoCamera
{
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];//初始化
    pickerVC.delegate = self;
    pickerVC.allowsEditing = YES;//设置可编辑
    
    if(TARGET_IPHONE_SIMULATOR) {
        pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }else{
        pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    
    [self presentViewController:pickerVC animated:YES completion:nil];//进入照相界面
}

-(void)openPhotoAlbum
{
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        pickerVC.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerVC.sourceType];
        
    }
    pickerVC.delegate = self;
    pickerVC.allowsEditing = NO;
    [self presentViewController:pickerVC animated:YES completion:nil];
    
}

#pragma mark -
#pragma mark - Apply / Submit -
- (IBAction)shopKeeperApplyAction:(UIButton *)sender {
    
    PostedCoffeeShopViewController *postedCoffeeShopVC = [[PostedCoffeeShopViewController alloc] init];
    postedCoffeeShopVC.applyFrom = Apply_By_Shopkeeper;
    [self.navigationController pushViewController:postedCoffeeShopVC animated:YES];
    
}

- (IBAction)submitAction:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)shopKeeperSubmitAction:(UIButton *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}



#pragma mark -
#pragma mark - Photo Picker -
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    /*
     UIImagePickerControllerCropRect
     UIImagePickerControllerEditedImage
     UIImagePickerControllerMediaType
     UIImagePickerControllerOriginalImage
     UIImagePickerControllerReferenceURL
     */
    
    if ([self.chooseButton isEqual:self.permitPhotoLF.rightButton]) {
        self.permitPhotoLF.rightImgV.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    }else {
        [self.chooseButton setImage:[info objectForKey:@"UIImagePickerControllerOriginalImage"] forState:UIControlStateNormal];
        [self.uploadImageLF addOneMoreUploadButtonWithTarget:self action:@selector(showActionSheet:)];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
