   M S B A M L   `   `   `  ����  PorcelainInventoryApp;    5PorcelainInventoryApp.Views.AddWindows.AddStockWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5   	     � Title$  	Add Stock��5   	   $��0q�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � 
ResizeMode$ NoResize=�5   	   $	��415��5	   	   $	��266��6    � WindowStyle$
 None=�5
   	   .��5      �� 
�������$��2q�6     �� CornerRadius$ 10��64   
������� �� Padding$ 10q�6Y   ._�5   
   � $��20q�6    � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    .+�5      �� $��	Add Stock��6   $��24(�6)   $��SemiBold"�67   
���   �$��0��6`   �� 5      $��1��6    �� Orientation$ 
Horizontal=�6&   $��	0 20 0 10q�6?   .+�5      �� $��Product Name:��6   $	��120��61   $��Center=�6=   �� 5      -   5         ��Name$ txtProductName��5      $	��250��64   $��Center=�6@   5      �� 5      $��2��6   $ 
Horizontal=�6&   $��	0 10 0 10q�6?   .+�5      �� $��Quantity to Add:��6   $	��120��64   $��Center=�6@   �� 5       $ 
Horizontal=�6   .+�5!      �� -   5        $��-��5!      $��30��6)   $��20��64   6@   �� 5"      -   5        	 ��Name$	 txtQuantityToAdd��5"   )   $��50��6   $��0��6C   
 �� 
IsReadOnly$

 True��6L   $��5,0,5,0q�6^   $��20��6o    �� TextAlignment$ Center=�6{   �� 5#      -   5        $��+��5#      $��26��6)   $��20��64   6@   5$      5%      �� 5(      $��3��6   $ 
Horizontal=�6&   $��Right=�6?   $��0 20 0 0q�6[   .+�5)      �� -   5        $��Update��5)         
saveButton#��[  5*      $��80��5+      $��30��6    ���#007FFF
�������$��5q�5.      5/      �� 50      -   5        $��Cancel��50        cancelButton#��[ 51      $��80��52      $��30��6    
�������
�������$��5q�55      56      57      58      59      5:      