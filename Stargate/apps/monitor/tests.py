import datetime
import json

from django.test import TestCase

# Create your tests here.
# import os
# from django.db.models import Q, Count
#
# if __name__ == "__main__":
#     os.environ.setdefault("DJANGO_SETTINGS_MODULE", "Stargate.settings")
#     import django
#
#     django.setup()
#     from monitor.models import AlertCenter
#
#     alert_obj = AlertCenter.objects.filter(
#         Q(TriggerID='27028') & Q(env='pro') & Q(status='alert')).first()
#     print(alert_obj)

a = {'receiver': 'starget-receiver', 'status': 'firing', 'alerts': [{'status': 'firing', 'labels': {'alertname': 'Blackbox web probe', 'instance': 'http://10.13.5.14:8000', 'job': 'HTTPProbe', 'node_name': 'http://10.13.5.14:8000', 'origin_prometheus': 'ops-cluster', 'project_name': 'yanwenliang', 'severity': 'critical'}, 'annotations': {'description': 'Blackbox probe failed to complete\n  VALUE = 0', 'summary': 'Endpoint http://10.13.5.14:8000 down'}, 'startsAt': '2022-01-17T08:56:07.911Z', 'endsAt': '0001-01-01T00:00:00Z', 'generatorURL': 'http://prometheus-federate-server-0:9090/graph?g0.expr=probe_success+%3D%3D+0&g0.tab=1', 'fingerprint': '0a2e48821cc57dd4'}, {'status': 'resolved', 'labels': {'alertname': 'BlackboxSlowProbe', 'instance': 'http://10.13.5.14:8000', 'job': 'HTTPProbe', 'node_name': 'http://10.13.5.14:8000', 'origin_prometheus': 'ops-cluster', 'project_name': 'yanwenliang', 'severity': 'warning'}, 'annotations': {'description': 'Blackbox probe took more than 1s to complete\n  VALUE = 10.000339188666665', 'summary': 'Blackbox slow probe (instance http://10.13.5.14:8000)'}, 'startsAt': '2022-01-17T09:00:07.911Z', 'endsAt': '2022-01-17T09:22:07.911Z', 'generatorURL': 'http://prometheus-federate-server-0:9090/graph?g0.expr=avg_over_time%28probe_duration_seconds%5B1m%5D%29+%3E+1&g0.tab=1', 'fingerprint': 'd3f9876e664c0c74'}], 'groupLabels': {}, 'commonLabels': {'instance': 'http://10.13.5.14:8000', 'job': 'HTTPProbe', 'node_name': 'http://10.13.5.14:8000', 'origin_prometheus': 'ops-cluster', 'project_name': 'yanwenliang'}, 'commonAnnotations': {}, 'externalURL': 'http://localhost:9093', 'version': '4', 'groupKey': '{}/{project_name="yanwenliang"}:{}', 'truncatedAlerts': 0}
import json

b = json.dumps(a)
print(b)
