   M S B A M L   `   `   `  ����  PorcelainInventoryAppE    ?PorcelainInventoryApp.Views.ConfirmWindows.ConfirmInvoiceWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5   	     � Title$  Confirm Invoice��5   	    � WindowStartupLocation$ CenterScreen=�5   	   $	��500��5   	   $	��550��6    � 
ResizeMode$ NoResize=�5   	    � WindowStyle$
 None=�5	   	   .��5      �� 
�������$��2q�6     �� CornerRadius$ 10��64   
������� �� Padding$ 10q�6Y   ._�5   
   � $��20q�6    � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $��* �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    .+�5      �� $��Confirm Invoice��6   $��24(�6/   $��SemiBold"�6=   
���   �$��0��6f   $��0,0,0,10q�6s   �� 5      $��1��6    �� Orientation$ 
Horizontal=�6&   $��	0,10,0,10q�6?   .+�5      �� $��Customer Name:��6   $	��120��62   $��Center=�6>   �� 5      -   5         ��Name$ txtCustomerName��5      $	��250��63   $��Center=�6?   $��0,0,10,0q�6Z   6l   5      &   System.Windows.Controls.DataGrid  5      -   5        	  Name$	 dgInvoiceSummary��5      $��2��61   
   AutoGenerateColumns$
 False��6>   $��	0,10,0,10q�6Z      
IsReadOnly$
 True��6n      Columns 5       0  *System.Windows.Controls.DataGridTextColumn  5!      ,  &System.Windows.Controls.DataGridColumn   Header$ Product Name��6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6_   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6?   �� *ProductName+6_     5"      $ Quantity��6)   $ 80 6X    6;   �� *
Quantity+6X     5#      $ Price��6)   $	 100 6j    68   �� *Price+ �� StringFormat$ 	₱{0:N2}��6j   5%      �� 5(      $��3��6   $ 
Horizontal=�6&   $��Right=�6?   $��	0,10,0,10q�6[   .+�5)      �� $��Total Amount:��6   $��16(�61   $
��Bold"�6?   $��Center=�6Q   �� 5*      -   5         ��Name$ txtTotalAmount��5*      $
��0.00��64   $��16(�6@   $
��Bold"�6N   
��� � �$��10,0,0,0q�6s   5+      �� 5.      $��4��6   $ 
Horizontal=�6&   $��Right=�6?   $��0,10,0,0q�6[   .+�5/      �� -   5        $��Cancel��5/         cancelButton#��[  50      $��80��51      $��30��6    
�������
�������$��5q�54      55      �� 56      -   5        $��Confirm��56        
saveButton#��[ 57      $	��100��58      $��30��6!   ���#007FFF
�������$��5q�5;      5<      5=      5>      5?      5@      