   M S B A M L   `   `   `  ����   PorcelainInventoryApp;    5PorcelainInventoryApp.Views.AddWindows.AddStockWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks     � Title$  	Add Stock��$��0q� � WindowStartupLocation$ CenterScreen=� � 
ResizeMode$ NoResize=�$	��415��$	��266�� � WindowStyle$
 None=�.���� 
�������$��2q� �� CornerRadius$ 10��
������� �� Padding$ 10q�._�� $��20q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �.+��� $��	Add Stock��$��24(�$��SemiBold"�
���   �$��0���� $��1�� �� Orientation$ 
Horizontal=�$��	0 20 0 10q�.+��� $��Product Name:��$	��120��$��Center=��� -    ��Name$ txtProductName��$	��250��$��Center=��� $��2��$ 
Horizontal=�$��	0 10 0 10q�.+��� $��Quantity to Add:��$	��120��$��Center=��� $ 
Horizontal=�.+��� -   $��-��$��30��$��20���� -   	 ��Name$	 txtQuantityToAdd��$��50��$��0��
 �� 
IsReadOnly$

 True��$��5,0,5,0q�$��20�� �� TextAlignment$ Center=��� -   $��+��$��26��$��20���� $��3��$ 
Horizontal=�$��Right=�$��0 20 0 0q�.+��� -   $��Update��   
saveButton#��[  $��80��$��30�����#007FFF
�������$��5q��� -   $��Cancel��  cancelButton#��[ $��80��$��30��
�������
�������$��5q�