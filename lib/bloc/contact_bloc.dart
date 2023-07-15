import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/models/contact.dart';

import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactState([]));

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is AddContactEvent) {
      final List<Contact> updatedContacts = List.from(state.contacts)
        ..add(event.contact);
      yield ContactState(updatedContacts);
    } else if (event is DeleteContactEvent) {
      final List<Contact> updatedContacts = List.from(state.contacts)
        ..remove(event.contact);
      yield ContactState(updatedContacts);
    }
  }
}
