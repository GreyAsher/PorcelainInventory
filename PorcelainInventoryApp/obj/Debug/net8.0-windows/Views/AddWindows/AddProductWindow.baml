   M S B A M L   `   `   `  ����  PorcelainInventoryApp=    7PorcelainInventoryApp.Views.AddWindows.AddProductWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5   	     � Title$  Product Manager��5   	    � WindowStartupLocation$ CenterScreen=�5   	    � 
ResizeMode$ NoResize=�5   	    � WindowStyle$
 None=�5   	   $	��381��6   $	��505��6)   .��5	      �� 
�������$��2q�6     �� CornerRadius$ 10��64   
������� �� Padding$ 10q�6Y   ._�5
   
   � $��20q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5      �� -   5         ��Name$ txtTitle��5      $��Add Product��6*   $��24(�6=   $��SemiBold"�6K   
���   �$��0��6t   �� 5   
   $��1��6    �� Orientation$ 
Horizontal=�6"   $��	0 10 0 10q�6;   .+�5      �� $��Product Name:��6   $	��120��6-   $��Center=�69   �� 5      -   5        	 ��Name$	 txtProductName��5   "   $	��250��6   6:   5      �� 5    
   $��2��6   $ 
Horizontal=�6"   $��	0 10 0 10q�6;   .+�5!      �� $��	Category:��6   $	��120��6)   $��Center=�65   �� 5"      -   5        
 ��Name$
 
cbCategory��5"   #   $	��250��6    �� DisplayMemberPath$ CategoryName��5$      ��5#      �� *
Categories+5$      5%      �� 5(   
   $��3��6   $ 
Horizontal=�6"   $��	0 10 0 10q�6;   .+�5)      �� $��Product Price:��6   $	��120��62   $��Center=�6>   �� 5*      -   5        $	 txtRetailPrice��5*   &   $	��250��6   6&   5+      �� 5.   
   $��5��6   $ 
Horizontal=�6"   $��	0 10 0 10q�6;   .+�5/      �� $��Product Image:��6   $	��120��6.   $��Center=�6:   �� 50      -   5        $	��141��50      $��Upload Image��6!   $��31��68   6D   51      �� 54   
   -   5         ��Name$ imageProduct��54      $
��Left=�55      $	��100��56      $��	380,0,0,0q�57      $��5��58      $	��Top=�59      $	��100��5:      $��Uniform=�5;      �� 5>   
   $��6��6   $ 
Horizontal=�6"   $��Right=�6;   $��0 20 0 0q�6W   .+�5?      �� -   5        $
��Save��5?         
saveButton#��[  5@      $��80��5A      $��30��6    ���#007FFF
�������$��5q�5D      5E      �� 5F      -   5        $��Cancel��5F        cancelButton#��[ 5G      $��80��5H      $��30��6    
�������
�������$��5q�5K      5L      5N      5O      5P      5Q      