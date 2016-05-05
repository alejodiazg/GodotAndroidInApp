
extends Control

# member variables here, example:
# var a=2
# var b="textvar"
var payment


func _ready():
	payment = Globals.get_singleton("GodotPayments")
	payment.setPurchaseCallbackId(get_instance_ID())
	payment.setAutoConsume(false) # default : true
	#payment.requestPurchased() # callback : has_purchased
	#payment.purchase("item_name") # callback : purchase_success, purchase_fail, purchase_cancel, purchase_owned
	#payment.consume("item_name") # callback : consume_success

func purchase_success(receipt, signature, sku):
	print("purchase_success : ", sku)

func purchase_fail():
	print("purchase_fail")

func purchase_cancel():
	print("purchase_cancel")

func purchase_owned(sku):
	print("purchase_owned : ", sku)

func consume_success(receipt, signature, sku):
	print("consume_success : ", sku)

func has_purchased(receipt, signature, sku):
	if sku == "":
		print("has_purchased : nothing")
	else:
		print("has_purchased : ", sku)


func _on_Purchased_pressed():
	payment.purchase("android.test.purchased" , "00000001")


func _on_Consumed_pressed():
	payment.consume("android.test.purchased" , "00000001")


func _on_Cancelled_pressed():
	#payment.purchase("android.test.canceled" , "00000001")
	pass


func _on_ProductError_pressed():
	payment.purchase("android.test.purchased11" , "00000001")
