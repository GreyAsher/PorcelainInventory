   M S B A M L   `   `   `  ����   PorcelainInventoryApp=    7PorcelainInventoryApp.Views.AddWindows.AddInvoiceWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks     � Title$  Add Invoice�� � WindowStartupLocation$ CenterScreen=�$	��600��$	��600�� � 
ResizeMode$ NoResize=� � WindowStyle$
 None=�.���� 
�������$��2q� �� CornerRadius$ 10��
������� �� Padding$ 10q�._�� $��20q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $��* ��� $	��150 ��� $
��Auto ��� $
��Auto �.+��� $��Add New Invoice��$��24(�$��SemiBold"�
���   �$��0��$��0,0,0,10q�&   System.Windows.Controls.DataGrid  -     Name$ 
dgProducts��$��2��   AutoGenerateColumns$ False��$��	0,10,0,10q�	   
IsReadOnly$
	 True��
   CanUserAddRows$
 False������ *
Products+   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Product Name��   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *ProductName+  $ Price��$	 100  �� *RetailPrice+ �� StringFormat$ 	₱{0:N2}��  $ Available Stock��$	 120  �� *StockQuantity+4  .System.Windows.Controls.DataGridTemplateColumn  $ Actions��$	 120    CellTemplate �� .R���  �� Orientation$ 
Horizontal=�.+��� -   $��+��$��30��$��25��$��5,0,5,0q��� $
��Cart��$��3��$��	0,10,0,10q�.���� -    ��Name$ lstCart��$	��106��$
��True������ *CartProducts+���� .R��� $ 
Horizontal=�.+��� $	��200��$��Center=����� *ProductName+�� $��50��$��Center=�$��Center=����� *
Quantity+�� $��70��$��Center=����� *RetailPrice+$ 	₱{0:N2}���� -   $��-��$��30��$��25���� $��4��$ 
Horizontal=�$��Right=�$��	0,10,0,10q�.+��� $��Total Amount:��$��16(�$
��Bold"�$��Center=��� -    ��Name$ txtTotalAmount��$
��0.00��$��16(�$
��Bold"�
��� � �$��10,0,0,0q��� $��5��$ 
Horizontal=�$
��Left=�$��0,10,0,0q�.+�.  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$
 Cart=�$��30��$��30��
���   �$��Center=��� -    ��Name$ lblCartCount��$��Cart: 0 items��$
��Bold"�
��� � �$��Right=�$��10q��� $��5��$ 
Horizontal=�$��Right=�$��0,10,0,0q�.+��� -   $��Cancel��   cancelButton#��[  $��80��$��30��
�������
�������$��5q��� -   $��Proceed��  
saveButton#��[ $	��100��$��30�����#007FFF
�������$��5q�