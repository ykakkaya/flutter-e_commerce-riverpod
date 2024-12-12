import 'package:flutter/material.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "ABC2024",
        suffixIcon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle,
                  color: Colors.green), // Yeşil onay simgesi
              SizedBox(
                  width: 4), // Simge ile yazı arasındaki boşluk
              Text(
                "Kod geçerli",
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors
                .red, // Aktif olmayan durumda çerçeve rengi
            width: 2.0, // Çerçeve genişliği
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red, // Odaklanıldığında çerçeve rengi
            width: 2.0, // Çerçeve genişliği
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue, // Varsayılan çerçeve rengi
            width: 2.0, // Çerçeve genişliği
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
