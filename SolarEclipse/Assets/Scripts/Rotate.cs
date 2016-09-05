using UnityEngine;
using System.Collections;
using System;

public class Rotate : MonoBehaviour {

    public float RotateSpeed = 5.0f;
    public float distance_to_screen;
    public GameObject sun = null;
    public GameObject moon= null ; 
    public GameObject earth = null; 
    public double distance1;
    public double distance2;
    public double distance3;
    public bool flag;
    public int count;

    // Use this for initialization
    void Start()
    {
        sun = GameObject.FindGameObjectWithTag("Sun");
        moon = GameObject.FindGameObjectWithTag("Moon");
        earth = GameObject.FindGameObjectWithTag("Earth");
        distance1 = 0;
        distance2 = 0;
        distance3 = 0;
        flag = false;
        count = 0;
    }

    // Update is called once per frame
    void Update () {
        if (flag == false) {
            transform.RotateAround(Vector3.up, RotateSpeed * Time.deltaTime);
            count++;
        }
        if (sun != null && moon != null && earth != null)
        {
            distance3 = (moon.transform.position.z - sun.transform.position.z) > 0 ? (moon.transform.position.z - sun.transform.position.z) : (sun.transform.position.z - moon.transform.position.z);
            distance1 = (moon.transform.position.z - sun.transform.position.z) > 0 ? (moon.transform.position.z - sun.transform.position.z) : (sun.transform.position.z - moon.transform.position.z) + (earth.transform.position.z - moon.transform.position.z) > 0 ? (earth.transform.position.z - moon.transform.position.z) : (moon.transform.position.z - earth.transform.position.z);
            distance2 = (earth.transform.position.z - sun.transform.position.z) > 0 ? (earth.transform.position.z - sun.transform.position.z) : (sun.transform.position.z - earth.transform.position.z);
        }
        if (count==161)
        {
            print("earth global pos : "+ earth.transform.position +"\n");
            //print("moon global pos : " + moon.transform.position + "\n");
            //print("from rotate distance2: " + distance2 +"\n");
            //print("from rotate distance1: " + distance1 + "\n");
            //   print("solar eclipse");

            flag = true;
         }

    }
    void OnMouseDrag()
    {
        distance_to_screen = Camera.main.WorldToScreenPoint(gameObject.transform.position).z;
        transform.position = Camera.main.ScreenToWorldPoint(new Vector3(Input.mousePosition.x, Input.mousePosition.y, distance_to_screen));
    }
}
