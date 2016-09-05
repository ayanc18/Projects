using UnityEngine;
using System.Collections;

public class Rotate2 : MonoBehaviour {

    public float RotateSpeed = 5.0f;
    public float distance_to_screen;
    public GameObject sun = null;
    public GameObject moon = null;
    public GameObject earth = null; 
    public float distance1;
    public float distance2;
    public bool flag;

    // Use this for initialization
    void Start () {
        sun = GameObject.FindGameObjectWithTag("Sun");
        moon = GameObject.FindGameObjectWithTag("Moon");
        earth = GameObject.FindGameObjectWithTag("Earth");
        distance1 = 0;
        distance2 = 0;
        flag = false;
    }

    // Update is called once per frame
    void Update () {
        if (flag == false) {
            transform.RotateAround(Vector3.up, RotateSpeed * Time.deltaTime);
        }
        if (sun != null && moon != null && earth != null)
        {
            distance1 = (sun.transform.position.z - moon.transform.position.z) > 0 ? (sun.transform.position.z - moon.transform.position.z) : -((sun.transform.position.z - moon.transform.position.z)) + (earth.transform.position.z - moon.transform.position.z) > 0 ? (earth.transform.position.z - moon.transform.position.z) : -(earth.transform.position.z - moon.transform.position.z);
            distance2 = (sun.transform.position.z - earth.transform.position.z) > 0 ? (sun.transform.position.z - earth.transform.position.z) : -(sun.transform.position.z - earth.transform.position.z);
        }
        if ((distance1 == distance2)? true :false)
        {
            print("from rotate2 distance1:"+ distance1);
            print("from rotate2 distance2:" + distance2);
            flag = true;
        }

	}
    void OnMouseDrag()
    {
        distance_to_screen = Camera.main.WorldToScreenPoint(gameObject.transform.position).z;
        transform.position = Camera.main.ScreenToWorldPoint(new Vector3(Input.mousePosition.x, Input.mousePosition.y, distance_to_screen));
    }
}
