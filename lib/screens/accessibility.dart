import 'package:flutter/material.dart';

class Accessibility extends StatefulWidget {
  const Accessibility({super.key});

  @override
  State<Accessibility> createState() => _AccessibilityState();
}

class _AccessibilityState extends State<Accessibility> {
  bool _isChecked = false;
  String _selectedOption = 'Option 1';
  int _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Simantic",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Semantics(
            label: "Judul Aplikasi",
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Aplikasi Semantics Buatan Anak Negeri",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ),

          // TEXTBOX WITH SEMANTICS
          Semantics(
            label: "Silahkan masukkan nama anda",
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Masukkan Nama",
                ),
              ),
            ),
          ),
          Semantics(
            label: "Masukkan alamat email",
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: MergeSemantics(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.help,
                      semanticLabel: "Bantuan",
                    ),
                    title: const Text(
                      "Hubungi",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.email,
                      semanticLabel: "Email",
                    ),
                    title: const Text(
                      "irfanmulya@gmail.com",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: MergeSemantics(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  Semantics(
                      hint: _isChecked
                          ? "Anda memilih untuk setuju"
                          : "Anda belum setuju"),
                  const Text("Setuju"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Semantics(
                      onTapHint: "Ketuk 2 kali untuk masuk ke aplikasi",
                      child: const Text("Masuk"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Keluar"),
                  ),
                ),
              ],
            ),
          ),

          // FAB WITH SEMANTICS
          Semantics(
            label: "Floating Action Button",
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {},
                tooltip: 'Tambah item',
                child: const Icon(Icons.add), // Tooltip for FAB
              ),
            ),
          ),

          // RADIO BUTTON WITH SEMANTICS
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Semantics(
              label: "Pilihan Jenis Kelamin",
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio<int>(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: (int? value) {
                          setState(() {
                            _radioValue = value!;
                          });
                        },
                      ),
                      const Text("Laki-laki")
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: (int? value) {
                          setState(() {
                            _radioValue = value!;
                          });
                        },
                      ),
                      const Text("Perempuan")
                    ],
                  ),
                ],
              ),
            ),
          ),

          // SPINNER WITH SEMANTICS
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Semantics(
              label: "Pilih Jumlah Item",
              child: DropdownButton<String>(
                value: _selectedOption,
                items: <String>['Option 1', 'Option 2', 'Option 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedOption = newValue!;
                  });
                },
              ),
            ),
          ),

          // 5. CHIPS WITH SEMANTICS
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Semantics(
              label: "Pilih Hobi",
              child: MergeSemantics(
                child: Wrap(
                  children: [
                    Chip(
                      label: const Text("Berenang"),
                      onDeleted: () {},
                    ),
                    Chip(
                      label: const Text("Membaca"),
                      onDeleted: () {},
                    ),
                    Chip(
                      label: const Text("Bersepeda"),
                      onDeleted: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
