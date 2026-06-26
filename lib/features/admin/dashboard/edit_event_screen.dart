import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Handles native gallery image selection
import 'dart:io';
import 'package:intl/intl.dart'; // Standard package for formatting and parsing dates
import 'event_model.dart';

class EditEventScreen extends StatefulWidget {
  final EventModel event;
  const EditEventScreen({super.key, required this.event});

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  // Global form key for validating text inputs before structural submission
  final _formKey = GlobalKey<FormState>();

  // Text controlling state managers
  late TextEditingController _titleController;
  late TextEditingController _locationController;
  late TextEditingController _descriptionController;
  late TextEditingController _timeController;       
  late TextEditingController _dateController;       
  late TextEditingController _organizerController;  

  // Image storage variables
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.event.title);
    _locationController = TextEditingController(text: widget.event.location);
    _descriptionController = TextEditingController(text: widget.event.description);
    _timeController = TextEditingController(text: widget.event.time);
    _dateController = TextEditingController(text: '${widget.event.month} ${widget.event.day}');
    _organizerController = TextEditingController(text: widget.event.organizerName);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _timeController.dispose();
    _dateController.dispose();
    _organizerController.dispose();
    super.dispose();
  }

  // Invokes native calendar component dialog window framework safely
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        // Correct way to apply custom colors to the date picker dialog window template
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF6366F1), // Header background selection theme accent
              onPrimary: Colors.white,   // Header text tracking color
              onSurface: Colors.black87, // Calendar day grid numbers color overlay
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        // Format native structure smoothly into "Month Day" text format syntax representation
        _dateController.text = DateFormat('MMMM d').format(picked);
      });
    }
  }

  // Invokes native time collection clock selector module overlay UI
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        // Format native framework into readable local time signature standard context boundary
        _timeController.text = picked.format(context);
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _triggerDeleteSequence() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Delete Event?', style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text('Are you sure you want to drop this event record? This cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); 
                Navigator.pop(context, 'deleted'); 
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ========================================================
              // IMAGE BLOCK STACK LAYER WITH DISMISS/REMOVE OVERLAYS
              // ========================================================
              Stack(
                children: [
                  GestureDetector(
                    onTap: _pickImageFromGallery,
                    child: Container(
                      height: 240,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF6366F1), Color(0xFFC084FC)],
                        ),
                      ),
                      child: _selectedImage != null
                          ? Image.file(_selectedImage!, fit: BoxFit.cover)
                          : (widget.event.imagePath.isNotEmpty && !widget.event.imagePath.startsWith('lib/'))
                              ? Image.file(File(widget.event.imagePath), fit: BoxFit.cover)
                              : const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add_photo_alternate_outlined, size: 40, color: Colors.white70),
                                      SizedBox(height: 6),
                                      Text('Tap to change image from Gallery', style: TextStyle(color: Colors.white70, fontSize: 13)),
                                    ],
                                  ),
                                ),
                    ),
                  ),
                  Positioned(
                    top: 48,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.arrow_back, color: Colors.black87, size: 20),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 48,
                    right: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.delete_outline, color: Colors.black87, size: 20),
                        onPressed: _triggerDeleteSequence,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFA855F7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'CATEGORY',
                        style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Clean Inline Text Field for Title editing
                    TextFormField(
                      controller: _titleController,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1F2937)),
                      decoration: const InputDecoration(
                        hintText: 'Enter Event Title...',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                    const Divider(color: Color(0xFFE5E7EB)),
                    const SizedBox(height: 10),
                    
                    // ========================================================
                    // EDITABLE PICKER COMPONENT MODULE MATRIX (TIME / DATE / LOC)
                    // ========================================================
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                        boxShadow: const [
                          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.02), blurRadius: 10, offset: Offset(0, 2))
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Time Picker Interaction Triggers
                          Expanded(
                            child: InkWell(
                              onTap: () => _selectTime(context),
                              child: _buildCenteredMetaDisplayItem(Icons.access_time_filled, 'Time', _timeController),
                            ),
                          ),
                          // Calendar Date Picker Interaction Triggers
                          Expanded(
                            child: InkWell(
                              onTap: () => _selectDate(context),
                              child: _buildCenteredMetaDisplayItem(Icons.calendar_month, 'Date', _dateController),
                            ),
                          ),
                          // Location Entry Text Form Field Component
                          Expanded(
                            child: _buildCenteredEditableLocationItem(Icons.location_on, 'Location', _locationController),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // ========================================================
                    // REFACTORED ORGANIZER MANAGEMENT INPUT REGION
                    // ========================================================
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFF6366F1),
                          child: Icon(Icons.person, color: Colors.white, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: _organizerController,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1F2937)),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  hintText: 'Enter Organizer Name',
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text('Organizer', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text('About this event:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1F2937))),
                    const SizedBox(height: 6),
                    
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: null,
                      style: TextStyle(color: Colors.grey[600], height: 1.4, fontSize: 13),
                      decoration: const InputDecoration(
                        hintText: 'Enter event descriptions...',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('Read more', style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(height: 24),
                    
                    // Attendance Identity Mapping Elements
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Attendance QR', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1F2937))),
                          const SizedBox(height: 2),
                          const Text('Please scan when the event is started.', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          const SizedBox(height: 20),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.withValues(alpha: 0.15)),
                              ),
                              child: const Icon(Icons.qr_code_2_sharp, size: 130, color: Colors.black87),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Secondary Attachment execution buttons
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF818CF8), Color(0xFFC084FC)],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Add E-certificate', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_circle_right_outlined, color: Colors.white, size: 18),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  
                  // State Callback payload mapping on save action triggers
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6366F1), Color(0xFFA855F7)],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          String monthData = widget.event.month;
                          String dayData = widget.event.day;
                          List<String> splitDate = _dateController.text.trim().split(' ');
                          if (splitDate.isNotEmpty) {
                            monthData = splitDate[0];
                            if (splitDate.length > 1) {
                              dayData = splitDate.sublist(1).join(' ');
                            }
                          }

                          Map<String, dynamic> updatedData = {
                            'title': _titleController.text,
                            'location': _locationController.text,
                            'description': _descriptionController.text,
                            'time': _timeController.text,
                            'month': monthData,
                            'day': dayData,
                            'organizerName': _organizerController.text,
                            'imagePath': _selectedImage != null ? _selectedImage!.path : widget.event.imagePath,
                          };

                          Navigator.pop(context, updatedData); 
                        },
                        child: const Text('Save Event Modifications', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  // Generates clean read-only centered metadata views for date/time displaying picked values
  Widget _buildCenteredMetaDisplayItem(IconData icon, String label, TextEditingController controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: const Color(0xFF6366F1), size: 13),
            const SizedBox(width: 4),
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11)),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          controller.text.isEmpty ? 'Select $label' : controller.text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6366F1), fontSize: 11),
        ),
      ],
    );
  }

  // Generates text entry field for addresses with an attached shortcuts for viewing references on map pipelines
  Widget _buildCenteredEditableLocationItem(IconData icon, String label, TextEditingController controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: const Color(0xFF6366F1), size: 13),
            const SizedBox(width: 4),
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11)),
          ],
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6366F1), fontSize: 11),
          decoration: const InputDecoration(
            hintText: 'Enter place name...',
            hintStyle: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.normal),
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }
}