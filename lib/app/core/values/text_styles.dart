import 'package:flutter/material.dart';

import '/app/core/values/app_colors.dart';

const titleCenterTextStyle=TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.black54,
);

const centerTextStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: AppColors.centerTextColor,
);

const subtitleTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: Colors.black87,
);


const greenAmountStyle = TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 14);
const redAmountStyle = TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 14);
const errorTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: AppColors.errorColor,
);

const greyDarkTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textColorGreyDark,
    );

const greyText_13_400 = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  color: AppColors.textColorGrey,
);

const greyText_14_500 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: AppColors.textColorGrey,
);


const primaryColorSubtitleStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.colorPrimary,
    height: 1.45);

const whiteText16 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

const grayText16_400= TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Color(0xFF6C6C6C),
);

const whiteText16_500 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

const whiteText14 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

const blueText14_600 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: AppColors.appBarColor,
);
const blackText16_600 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
color: Colors.black);
const blueText12_500 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: AppColors.appBarColor,
);



const whiteText12 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

const whiteText18 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

const whiteText32 = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

const cyanText16 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: AppColors.textColorCyan,
);

const cyanText32 = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.w400,
  color: AppColors.textColorCyan,
);

const dialogSubtitle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: AppColors.textColorPrimary,
);

const labelStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  height: 1.8,
);

final labelStylePrimaryTextColor = labelStyle.copyWith(
  color: AppColors.textColorPrimary,
  height: 1,
);

final labelStyleAppPrimaryColor = labelStyle.copyWith(
  color: AppColors.colorPrimary,
  height: 1,
);

final labelStyleGrey =
    labelStyle.copyWith(color: const Color(0xFF323232).withOpacity(0.5));

final labelCyanStyle = labelStyle.copyWith(color: AppColors.textColorCyan);

const labelStyleWhite = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  height: 1.8,
  color: Colors.white,
);

const black13_500 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.black);

const black14_500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black);
const black12_400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.black);

const appBarSubtitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.25,
    color: AppColors.colorWhite);

const cardTitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: AppColors.textColorPrimary);

const cardTitleCyanStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: AppColors.colorPrimary,
);

const cardSubtitleStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: AppColors.textColorGreyLight);

const titleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  height: 1.34,
);

const settingsItemStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

final cardTagStyle = titleStyle.copyWith(color: AppColors.textColorGreyDark);

const titleStyleWhite = TextStyle(
    fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.colorWhite);

const inputFieldLabelStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  height: 1.34,
  color: AppColors.textColorPrimary,
);

const cardSmallTagStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: AppColors.textColorGreyDark);

const pageTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.15,
    color: AppColors.appBarTextColor);

final pageTitleBlackStyle =
    pageTitleStyle.copyWith(color: AppColors.textColorPrimary);

const appBarActionTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: AppColors.colorPrimary,
);

const pageTitleWhiteStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.15,
    color: AppColors.colorWhite);

const extraBigTitleStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.w600,
  height: 1.12,
);

final extraBigTitleCyanStyle =
    extraBigTitleStyle.copyWith(color: AppColors.textColorCyan);

const bigTitleStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w700,
  height: 1.15,
);

const mediumTitleStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w500,
  height: 1.15,
);

const descriptionTextStyle = TextStyle(
  fontSize: 16,
);

final bigTitleCyanStyle =
    bigTitleStyle.copyWith(color: AppColors.textColorCyan);

const bigTitleWhiteStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w700,
  height: 1.15,
  color: Colors.white,
);

const boldTitleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w700,
  height: 1.34,
);
final boldTitleWhiteStyle =
    boldTitleStyle.copyWith(color: AppColors.textColorWhite);

final boldTitleCyanStyle =
    boldTitleStyle.copyWith(color: AppColors.textColorCyan);

final boldTitleSecondaryColorStyle =
    boldTitleStyle.copyWith(color: AppColors.textColorSecondary);

final boldTitlePrimaryColorStyle =
    boldTitleStyle.copyWith(color: AppColors.colorPrimary);



var boxDecorationStyle= BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  color: Colors.white,
  border: Border.all(
      color: Colors.black12
  ),
);