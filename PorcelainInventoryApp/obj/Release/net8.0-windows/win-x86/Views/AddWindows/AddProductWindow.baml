   M S B A M L   `   `   `  ����   PorcelainInventoryApp=    7PorcelainInventoryApp.Views.AddWindows.AddProductWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks     � Title$  Product Manager�� � WindowStartupLocation$ CenterScreen=� � 
ResizeMode$ NoResize=� � WindowStyle$
 None=�$	��381��$	��505��.���� 
�������$��2q� �� CornerRadius$ 10��
������� �� Padding$ 10q�._�� $��20q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* �.+��� -    ��Name$ txtTitle��$��Add Product��$��24(�$��SemiBold"�
���   �$��0���� $��1�� �� Orientation$ 
Horizontal=�$��	0 10 0 10q�.+��� $��Product Name:��$	��120��$��Center=��� -   	 ��Name$	 txtProductName��$	��250���� $��2��$ 
Horizontal=�$��	0 10 0 10q�.+��� $��	Category:��$	��120��$��Center=��� -   
 ��Name$
 
cbCategory��$	��250�� �� DisplayMemberPath$ CategoryName������ *
Categories+�� $��3��$ 
Horizontal=�$��	0 10 0 10q�.+��� $��Product Price:��$	��120��$��Center=��� -   $	 txtRetailPrice��$	��250���� $��5��$ 
Horizontal=�$��	0 10 0 10q�.+��� $��Product Image:��$	��120��$��Center=��� -   $	��141��$��Upload Image��$��31���� -    ��Name$ imageProduct��$
��Left=�$	��100��$��	380,0,0,0q�$��5��$	��Top=�$	��100��$��Uniform=��� $��6��$ 
Horizontal=�$��Right=�$��0 20 0 0q�.+��� -   $
��Save��   
saveButton#��[  $��80��$��30�����#007FFF
�������$��5q��� -   $��Cancel��  cancelButton#��[ $��80��$��30��
�������
�������$��5q�