import '../models/contact.dart';

abstract class ContactEvent {}

class AddContactEvent extends ContactEvent {
  final Contact contact;

  AddContactEvent(this.contact);
}

class DeleteContactEvent extends ContactEvent {
  final Contact contact;

  DeleteContactEvent(this.contact);
}
