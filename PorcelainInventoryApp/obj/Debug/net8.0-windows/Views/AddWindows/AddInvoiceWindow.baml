   M S B A M L   `   `   `  ����  PorcelainInventoryApp=    7PorcelainInventoryApp.Views.AddWindows.AddInvoiceWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5   	     � Title$  Add Invoice��5   	    � WindowStartupLocation$ CenterScreen=�5   	   $	��600��5   	   $	��600��5   	    � 
ResizeMode$ NoResize=�5	   	    � WindowStyle$
 None=�5
   	   .��5      �� 
�������$��2q�6     �� CornerRadius$ 10��64   
������� �� Padding$ 10q�6Y   ._�5   
   � $��20q�6    � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $��* �6    �� 5      $	��150 �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    .+�5      �� $��Add New Invoice��6   $��24(�6/   $��SemiBold"�6=   
���   �$��0��6f   $��0,0,0,10q�6s   &   System.Windows.Controls.DataGrid  5      -   5          Name$ 
dgProducts��5      $��2��6+      AutoGenerateColumns$ False��68   $��	0,10,0,10q�6T   	   
IsReadOnly$
	 True��5      
   CanUserAddRows$
 False��6%   ��5   g   �� *
Products+   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Product Name��6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6_   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6?   �� *ProductName+6_     5       $ Price��6)   $	 100 6p    68   �� *RetailPrice+ �� StringFormat$ 	₱{0:N2}��6p     5!      $ Available Stock��6)   $	 120 6d    6B   �� *StockQuantity+6d   4  .System.Windows.Controls.DataGridTemplateColumn  5"      $ Actions��6-   $	 120 6>      CellTemplate 5#      �� 5$      .R�5%   "   ��  �� Orientation$ 
Horizontal=�6-   .+�5&   &   �� -   5        $��+��5&   -   $��30��69   $��25��6D   $��5,0,5,0q�6P   6a   5'   #   5(      5*      5,      �� 5/      $
��Cart��6   $��3��6%   $��	0,10,0,10q�62   .��50      �� -   5         ��Name$ lstCart��50      $	��106��6+   $
��True��6]   ��68   �� *CartProducts+��51      �� 52      .R�53      �� $ 
Horizontal=�6)   .+�54   "   �� $	��200��6I   $��Center=�6U   ��6,   �� *ProductName+6U   �� 55   "   $��50��6F   $��Center=�6Q   $��Center=�6l   ��6,   �� *
Quantity+6l   �� 56   "   $��70��6a   $��Center=�6l   ��6,   �� *RetailPrice+$ 	₱{0:N2}��6l   �� 57   "   -   5        $��-��57   )   $��30��65   $��25��6@   6L   58      59      5;      5<      �� 5?      $��4��6   $ 
Horizontal=�6&   $��Right=�6?   $��	0,10,0,10q�6[   .+�5@      �� $��Total Amount:��6   $��16(�61   $
��Bold"�6?   $��Center=�6Q   �� 5A      -   5         ��Name$ txtTotalAmount��5A      $
��0.00��64   $��16(�6@   $
��Bold"�6N   
��� � �$��10,0,0,0q�6s   5B      �� 5E      $��5��6   $ 
Horizontal=�6&   $
��Left=�6?   $��0,10,0,0q�6Z   .+�5F      .  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$
 Cart=�6(   $��30��64   $��30��6?   
���   �$��Center=�6^   �� 5G      -   5         ��Name$ lblCartCount��5G      $��Cart: 0 items��6.   $
��Bold"�5H      
��� � �$��Right=�5I      $��10q�6)   5K      �� 5N      $��5��6   $ 
Horizontal=�6&   $��Right=�6?   $��0,10,0,0q�6[   .+�5O      �� -   5        $��Cancel��5O         cancelButton#��[  5P      $��80��5Q      $��30��6    
�������
�������$��5q�5T      5U      �� 5V      -   5        $��Proceed��5V        
saveButton#��[ 5W      $	��100��5X      $��30��6!   ���#007FFF
�������$��5q�5[      6    5\      5]      5^      5_      