#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "echo-client.h"
#include <iostream>
#include <pthread.h>
#include <signal.h>
#include <stdio.h>

using namespace std;

static const char *ECHO_SERVER_NAME = "org.freedesktop.DBus.Examples.Echo";
static const char *ECHO_SERVER_PATH = "/org/freedesktop/DBus/Examples/Echo";

EchoClient::EchoClient(DBus::Connection &connection, const char *path, const char *name)
: DBus::ObjectProxy(connection, path, name)
{
}

void EchoClient::Echoed(const DBus::Variant &value)
{
	cout << "!";
}

/*
 * For some strange reason, libdbus frequently dies with an OOM
 */

static const int THREADS = 22;

EchoClient *client = NULL;

void *greeter_thread(void *arg)
{
	DBus::Connection *conn = reinterpret_cast<DBus::Connection *>(arg);

	char idstr[16];

	snprintf(idstr, sizeof(idstr), "%lu", pthread_self());

	for (int i = 0; i < 22 ; ++i)
	{
		cout << client->Hello(idstr) << endl;
	}

	cout << idstr << " done " << endl;

	return NULL;
}

DBus::BusDispatcher dispatcher;

void *dbus_thread(void *arg)
{
	dispatcher.enter();
	return NULL;
}

int main()
{
	DBus::_init_threading();

	DBus::default_dispatcher = &dispatcher;
	DBus::Connection conn = DBus::Connection::SessionBus();

	if ( client == NULL ){
		client = new EchoClient(conn, ECHO_SERVER_PATH, ECHO_SERVER_NAME);
	}

	for(int cnt=0; cnt<100; cnt++ ){
		pthread_t thread_main;
		pthread_create( &thread_main, NULL, dbus_thread, NULL);

		pthread_t threads[THREADS];

		for (int i = 0; i < THREADS; ++i)
		{
			pthread_create(threads+i, NULL, greeter_thread, &conn);
		}

		cout << "terminating" << endl;

		for (int i = 0; i < THREADS; ++i)
		{
			pthread_join(threads[i], NULL);
		}
	}

	cout << "====================All done=================" << endl;
	system( "pause" );

	return 0;
}
