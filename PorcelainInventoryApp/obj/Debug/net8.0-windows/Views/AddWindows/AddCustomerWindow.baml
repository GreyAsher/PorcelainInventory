   M S B A M L   `   `   `  ����  PorcelainInventoryApp>    8PorcelainInventoryApp.Views.AddWindows.AddCustomerWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5   	     � Title$  Customer Manager��5   	    � WindowStartupLocation$ CenterScreen=�5   	    � 
ResizeMode$ NoResize=�5   	    � WindowStyle$
 None=�5   	   $	��253��6   $	��415��6)   .��5
      �� 
�������$��2q�6     �� CornerRadius$ 10��64   ._�5   
   � $��20q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5   
   �� -   5         ��Name$ txtTitle��5      $��Add New Customer��6&   $��24(�6>   $��SemiBold"�6L   
���   �$��0��6u   �� 5   
   $��1��6    �� Orientation$ 
Horizontal=�6"   $��	0 10 0 10q�6;   .+�5      �� $��
Full Name:��6   $	��120��6*   $��Center=�66   �� 5      -   5         ��Name$ txtFullName��5   "   $	��250��6   6"   5      �� 5   
   $��2��6   $ 
Horizontal=�6"   $��	0 10 0 10q�6;   .+�5       �� $��Contact Number:��6   $	��120��6/   $��Center=�6;   �� 5!      -   5        $ txtContactNumber��5!   "   $	��250��6   6"   5"      �� 5%   
   $��3��6   $ 
Horizontal=�6"   $��	0 10 0 10q�6;   .+�5&      �� $��Email:��6   $	��120��6&   $��Center=�62   �� 5'      -   5        $ txtEmail��5'   "   $	��250��6   6"   5(      �� 51   
   $��5��6   $ 
Horizontal=�6"   $��Right=�6;   $��0 20 0 0q�6W   .+�52      �� -   5        $
��Save��52         
saveButton#��[  53      $��80��54      $��30��6    ���#007FFF
�������$��5q�57      58      �� 59      -   5        $��Cancel��59        cancelButton#��[ 5:      $��80��5;      $��30��6    
�������
�������$��5q�5>      5?      5@      5A      5B      5C      