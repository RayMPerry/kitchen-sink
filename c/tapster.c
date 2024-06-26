#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

char * dtos(double number) {
  int len = snprintf(NULL, 0, "%f", number);
  char * result = malloc(len + 1);
  snprintf(result, len + 1,  "%f", number);
  return result;
}

typedef struct {
  char * number;
  char * cardholder_name;
  double balance;
  double ounces_poured;
} Card;

Card new_card(const char * number, const char * cardholder_name) {
  Card c = { ((char *) number), ((char *) cardholder_name), 0.0, 0.0 };
  return c;
}

typedef enum {
  INSERTED = 0,
  CHARGED,
  REMOVED
} ReaderEventType;

const char * EVENT_TYPES[] = { "INSERTED", "CHARGED", "REMOVED" };

typedef struct {
  ReaderEventType type;
  int timestamp;
  char * payload;
} ReaderEvent;

ReaderEvent new_reader_event(ReaderEventType event_type, char * payload) {
  ReaderEvent re = { event_type, (int) time(NULL), payload };
  return re;
}

typedef struct {
  void * current_card;
  ReaderEvent events[100];
  int number_of_events;
} Reader;

void insert_card(Reader * r, Card * card) {
  ReaderEvent new_event = new_reader_event(INSERTED, card->cardholder_name);
  r->events[r->number_of_events] = new_event;
  r->number_of_events += 1;
  r->current_card = card;
} 

void remove_card(Reader * r) {
  ReaderEvent new_event = new_reader_event(REMOVED, ((Card *) r->current_card)->cardholder_name);
  r->events[r->number_of_events] = new_event;
  r->number_of_events += 1; 
  r->current_card = NULL;
}

void charge_card(Reader * r, double ounces_poured, double price_per_ounce) {
  if (r->current_card == NULL) return;
  double charge = ounces_poured * price_per_ounce;
  char * payload = dtos(charge);
  ReaderEvent new_event = new_reader_event(CHARGED, payload);
  r->events[r->number_of_events] = new_event;
  r->number_of_events += 1;
  ((Card *) r->current_card)->balance += charge;
  ((Card *) r->current_card)->ounces_poured += ounces_poured;
}

void display_stats(Reader * r) {
  if (r->current_card == NULL) return;
  printf("Cardholder name: %s\n", ((Card *) r->current_card)->cardholder_name);
  printf("Balance: %.2f\n", ((Card *) r->current_card)->balance);
  printf("Ounces poured: %.2f\n", ((Card *) r->current_card)->ounces_poured);
  for (int i = 0; i < r->number_of_events; i++) {
    if (r->events[i].type == CHARGED) {
      double charge;
      sscanf(r->events[i].payload, "%lf", &charge);
      printf("%d - %s - %.2lf\n", r->events[i].timestamp, EVENT_TYPES[r->events[i].type], charge);
    } else {
      printf("%d - %s - %s\n", r->events[i].timestamp, EVENT_TYPES[r->events[i].type], r->events[i].payload);
    }
  }
}

int main(void) {
  Card card = new_card("5555555555555555", "Ray Perry");
  Reader reader;

  insert_card(&reader, &card);
  charge_card(&reader, 10.3, 0.79);
  remove_card(&reader);
  insert_card(&reader, &card);

  display_stats(&reader);
  
  return 0;
}

// Local Variables:
// compile-command: "gcc -g -std=c11 -Wall -Wextra -Wpedantic -Wformat=2 -Wno-unused-parameter -Wshadow -Wwrite-strings -Wstrict-prototypes -Wold-style-definition -Wredundant-decls -Wnested-externs -Wmissing-include-dirs -o ./tapster tapster.c && ./tapster"
// End:
