from django.utils import timezone

def timer(data, timeout_seconds):
    if data.start_time is None:
        data.start_time = timezone.now()
        data.save()
    else:
        if (timezone.now() - data.start_time).total_seconds() >= timeout_seconds and data.repeat:
            data.start_time = timezone.now()
            data.save()
            return True
        elif (timezone.now() - data.start_time).total_seconds() >= timeout_seconds and not data.repeat:
            data.active = False
            data.start_time = None
            data.save()
            return True
    return False
