import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  vus: 3,
  duration: '10s',
  insecureSkipTLSVerify: true,
  thresholds: {
    'http_req_duration': ['p(95)<1000'],
    'checks': ['rate>0.95'],
  },
};

export default function () {
  const response = http.get('https://ibm-z-mainframe:32208/zosmf/info', {
    headers: { 'Accept': 'application/json' },
  });

  check(response, {
    'z/OSMF responds (200 or 401)': (r) => r.status === 200 || r.status === 401,
    'response time < 1000ms':       (r) => r.timings.duration < 1000,
  });

  sleep(1);
}
