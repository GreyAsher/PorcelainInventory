   M S B A M L   `   `   `  ����   PorcelainInventoryAppE    ?PorcelainInventoryApp.Views.ConfirmWindows.ConfirmInvoiceWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks     � Title$  Confirm Invoice�� � WindowStartupLocation$ CenterScreen=�$	��500��$	��550�� � 
ResizeMode$ NoResize=� � WindowStyle$
 None=�.���� 
�������$��2q� �� CornerRadius$ 10��
������� �� Padding$ 10q�._�� $��20q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto ��� $
��Auto �.+��� $��Confirm Invoice��$��24(�$��SemiBold"�
���   �$��0��$��0,0,0,10q��� $��1�� �� Orientation$ 
Horizontal=�$��	0,10,0,10q�.+��� $��Customer Name:��$	��120��$��Center=��� -    ��Name$ txtCustomerName��$	��250��$��Center=�$��0,0,10,0q�&   System.Windows.Controls.DataGrid  -   	  Name$	 dgInvoiceSummary��$��2��
   AutoGenerateColumns$
 False��$��	0,10,0,10q�   
IsReadOnly$
 True��   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Product Name��   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *ProductName+  $ Quantity��$ 80  �� *
Quantity+  $ Price��$	 100  �� *Price+ �� StringFormat$ 	₱{0:N2}���� $��3��$ 
Horizontal=�$��Right=�$��	0,10,0,10q�.+��� $��Total Amount:��$��16(�$
��Bold"�$��Center=��� -    ��Name$ txtTotalAmount��$
��0.00��$��16(�$
��Bold"�
��� � �$��10,0,0,0q��� $��4��$ 
Horizontal=�$��Right=�$��0,10,0,0q�.+��� -   $��Cancel��   cancelButton#��[  $��80��$��30��
�������
�������$��5q��� -   $��Confirm��  
saveButton#��[ $	��100��$��30�����#007FFF
�������$��5q�