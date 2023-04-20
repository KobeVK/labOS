from django.http import JsonResponse
import requests

def get_last_release(request, user, repo):
    url = f'https://api.github.com/repos/{user}/{repo}/releases/latest'
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        tag_name = data['tag_name']
        return JsonResponse({'last_release_version': tag_name})
    else:
        return JsonResponse({'error': 'Could not retrieve last release version'})